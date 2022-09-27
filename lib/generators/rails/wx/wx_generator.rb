#require 'json'
#class Rails::WxGenerator < Rails::Generators::Base
#  source_root File.expand_path('../wxtemplates', __FILE__)
#  
#  #model或attrs 也可通过@model或@columns访问
#  argument :model, :type => :string, :default => "model"
#  argument :columns, :type => :array, :default => []
#
#  class_option :name, :aliases => '-n',  :type => :string, :default => ""
#
#  class_option :label, :aliases => '-l', :type => :array, :default => []
#  class_option :tag, :aliases => '-t', :type => :array, :default => []
#  class_option :required, :aliases => '-u', :type => :array, :default => []
#  
#  class_option :one_image, :aliases => '-b', :type => :array, :default => []
#  class_option :one_attachment, :aliases => '-k', :type => :array, :default => [] 
#
#  class_option :properties, :aliases => '-m', :type => :array, :default => []
#
#  class_option :flags, :aliases => '-i', :type => :array, :default => []
#
#
#  def generate_controller_view
#    @mu = model.underscore
#
#    @one_enclosure = options[:one_image]
#    @one_attachment = options[:one_attachment]
#
#    @enclosure = flag_boolean(options[:flags][0])
#    @attachment = flag_boolean(options[:flags][1])
#    @index = flag_boolean(options[:flags][2])
#    @new  = flag_boolean(options[:flags][3])
#    @edit = flag_boolean(options[:flags][4])
#    @show = flag_boolean(options[:flags][5])
#    @form = flag_boolean(options[:flags][6])
#    @js   = flag_boolean(options[:flags][7])
#    @scss = flag_boolean(options[:flags][8])
#    @upload   = flag_boolean(options[:flags][9])
#    @download = flag_boolean(options[:flags][10])
#    @current_user = flag_boolean(options[:flags][11])
#    @admin = flag_boolean(options[:flags][12])
#
#    @attrs = []
#    columns.each do |column|
#      @attrs << column.slice(/[^:]+/)
#    end
#
#    template 'page.template', "public/wxtemplate/#{@mu}.wxml", @attrs, @enclosure, @attachment, @one_enclosure, @one_attachment, @index, @new, @edit, @show, @form, @js, @scss, @upload, @download, @current_user, @admin
#
#    template 'scss.template', "public/wxtemplate/#{@mu}.wxss", @download
#
#    template 'json.template', "public/wxtemplate/#{@mu}.json", @enclosure
#
#    if @enclosure
#      template 'componentjs.template', "public/wxtemplate/#{@mu}.js", @attrs, @enclosure, @attachment, @one_enclosure, @one_attachment, @index, @new, @edit, @show, @form, @js, @scss, @upload, @download, @current_user, @admin
#    else
#      template 'pagejs.template', "public/wxtemplate/#{@mu}.js", @attrs, @enclosure, @attachment, @one_enclosure, @one_attachment, @index, @new, @edit, @show, @form, @js, @scss, @upload, @download, @current_user, @admin
#    end
#
#  end
#
#  private
#    def file_name
#      model.underscore
#    end
#
#    def controller_name
#      model.pluralize.underscore
#    end
#
#    def flag_boolean(flag)
#      flag == "true" ? true : false
#    end
#end
