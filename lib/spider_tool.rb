# encoding: UTF-8

require 'restclient'
require 'open-uri'
require 'open_uri_redirections'
require 'nokogiri'
require 'json'
require 'yaml'
require 'fileutils'
require 'base64'

class SpiderTool
  MAX_RETRY_TIMES = 5

  def initialize
    spider_dir = File.join(Rails.root, "public", "spider")
    Dir::mkdir(spider_dir) unless File.directory?(spider_dir)

    @root_dir = spider_dir
    @download_error = Logger.new( @root_dir + '/download_error.log')
    @no_doc = Logger.new( @root_dir + '/nodoc_error.log')
    @parse_error = Logger.new( @root_dir + '/parse_error.log')
  end

  #返回hash, {
  #            selector.name&selector.title: ["", ""], 
  #            "选择器名&标题名": ["", ""],
  #            "选择器名&标题名": ["", ""],
  #          } 
  def process(spider)
    @spider = spider
    @doc_save = @spider.doc_save
    @doc_parse = @spider.doc_parse
    @result = []
    @file_result = []
    result_hash = Hash.new 
    spider_link = @spider.link
    
    unless @spider.page.blank?
      page_arr = @spider.page.split("-").map do |i|
        i.to_i
      end
      pages = Array(page_arr[0]..page_arr[1])
      pages.each_with_index do |i, index|
        link = spider_link + i.to_s + '.html'

        doc = get_doc(@spider, link)
        if doc.nil?
          @no_doc.error link
          next
        end
  
        save_doc(link, doc, i) if @doc_save

        result_hash = parse(@spider, doc) if @doc_parse
    

      end
    else
      doc = get_doc(@spider, spider_link)
      if doc.nil?
        @no_doc.error spider_link
      else
        save_doc(spider_link, doc, "源网页") if @doc_save
        result_hash = parse(@spider, doc) if @doc_parse
      end
    end
    result_hash
  end

  def parse(spider, doc)
    @selectors = spider.selectors
    result_hash = Hash.new 
    @selectors.each do |s|
      nodes = doc.css(s.name)

      if nodes.blank?
        next
      end

      if s.category == Setting.selectors.categories.text.value
        nodes.each do |node|
          @result << node.text
        end
      elsif s.category == Setting.selectors.categories.attr.value
        nodes.each do |node|
          @result << node[s.title]
        end
      elsif s.category == Setting.selectors.categories.html.value
        @result << nodes[0].to_s
      elsif s.category == Setting.selectors.categories.img.value
        nodes.each do |node|
          file_name = download_file(node[s.title])
          @result << file_name
        end
      end
      result_hash[s.name + '$' + s.title] = @result
      if s.file
        @target = File.join(Rails.root, "public", "spider", s.title) 
        File.open(@target + ".yml",'a+'){|f| YAML.dump(@result, f)}
      end
      @result = []
    end
    result_hash
  end
  
  def get_doc(spider, search_link)
    sleep rand(1..5) 
    retry_times = 0
    doc = nil

    @header = spider.header
    @agent = spider.agent
    @cookie = spider.cookie
  
    begin
      #doc = Nokogiri::HTML(open(search_link))
      #todo solve follow_redirect can not in rails 
      #RestClient.get(search_link) do |response|
      #  #doc = Nokogiri::HTML(response.follow_redirection) 
      #end
      #doc = Nokogiri::HTML
      
      #doc = open(search_link, { 
      doc_res = RestClient.get(search_link, { 
          "User-Agent" => @agent,
          "accept" => "application/json, text/plain, */*",
          "content-type" => "application/json",
          #"accept-encoding" =>  "gzip, deflate, br",
          #"accept-language" => "en-US,en;q=0.9"
        }
      )
      doc = Nokogiri::HTML(doc_res)
    rescue Exception => e
      puts "get doc error " + e.message
      retry_times += 1
      @download_error.error "get doc error: #{search_link}"
      retry if retry_times < MAX_RETRY_TIMES
    end
    return doc
  end
  
  #此处为了下载公众号文章把获取后缀给去掉了,因为公众号文章图片不知道什么格式
  def download_file(image)
    sleep rand(1..5) 
    begin
      name = Time.now.to_i.to_s + "%04d" % [rand(10000)]
      img = name
      #suffix = image.sub(/.+\./, '')
      #img = name + "." + suffix

      img_dir = File.join(Rails.root, "public", "spider", Date.today.to_s)
      Dir::mkdir(img_dir) unless File.directory?(img_dir)

      File.open("#{img_dir}/#{img}", "w") do |f|
        f.write(open("#{image}").read.force_encoding('utf-8'))
      end
    rescue Exception => e   
      img = image 
      @download_error.error "download file error: #{image}  " + e.message
    end
    return "/spider/" + Date.today.to_s + "/" + img 
  end
  
  def img_base64(image_src)
    file = open(image_src).read
    image = Base64.encode64(file)
  end

  def save_doc(link, doc, i)
    #name = Time.now.to_i.to_s + "%04d" % [rand(10000)] + ".txt"
    name = i.to_s + ".txt"
    file = File.join(Rails.root, "public", "spider", name) 
    File.open(file,'w+') do|f| 
      f.write(doc)
    end
  end

end

#COOKIE = {:VerificationCodeNum => '1', :QZ_KSUser => 'UserID=15357507&UserName=ppkao1520606811&UserToken=cw05IVsvRbyxuPoQeQIU4%252bZNshdiFE%252fN6LGCVScB%252bnQLBUYAu7SA7A%253d%253d'}
#doc = Nokogiri::HTML(open(search_link, 
#      "Cookie" => @cookie,
#      "User-Agent" => @agent,
#      "Referer" => "https://study.chinaedu.com/megrez/synchronous/list.do?gradeCode=0201&specialtyCode=02",
#      "Host" => "study.chinaedu.com",
#      :allow_redirections => :all
#      ))


#RestClient.get(search_link, {:cookies => @cookie} ) do |response|
#  puts response
#  doc = Nokogiri::HTML(response.follow_redirection) 
#end

#RestClient.post(url, {access_token: access_token, image: image}, {content_type: @content_type}) do |response|
#  body = JSON.parse(response.body)
#  return body["words_result"][0]["words"]
#end

