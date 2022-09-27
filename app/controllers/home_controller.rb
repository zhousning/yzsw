class HomeController < ApplicationController
  layout :determine_layout

  def index
    @engine = Engine.first
    @matters = Matter.all
    @carousels = Carousel.all
    @showrooms = Showroom.all
    @shutters = Shutter.all
    @home_setting = HomeSetting.last
    @diyi, @dangjian, @dier, @disan = [], [], [], []
    @home_content = HomeContent.first

    @positions = Position.all
    markers = []
    @positions.each do |pos|
      markers << {
        'title': pos.title,
        'content': pos.content,
        'position': {
          'lat': pos.lat,
          'lng': pos.lnt
        },
        'imageOffset': {'width': 0, 'height': 3}
      }
    end
    @markers = markers.to_json

    if @home_setting
      @diyi = get_sections(@home_setting.diyi) 
      @dangjian = get_sections(@home_setting.dangjian) 
      @dier = get_sections(@home_setting.dier) 
      @disan = get_sections(@home_setting.disan) 
    end

  end
  

  private
    def determine_layout
      @engine = Engine.first
      engine_template(@engine) 
    end

    def get_sections(section) 
      obj = []
      unless section.blank?
        secd_ids = ''
        section.strip.split(';').each do |content|
          secd_ids += content.split(',')[0] + ','
        end
        ids = secd_ids.split(',')
        secds = Secd.find(ids)
        obj = ids.collect {|id| 
          record = secds.detect {|secd| secd.id.to_s == id}
          articles = []
          record.articles.limit(10).order('pdt_date DESC').each do |article|
            articles << {
              :id => article.id,
              :title => article.title,
              :content => article.raw_content[0..100],
              :pdt_date => article.pdt_date.strftime('%Y-%m-%d')
            }
          end
          {
            :id => record.id,
            :name => record.name,
            :articles => articles
          }
        }
      end
      obj
    end

end
