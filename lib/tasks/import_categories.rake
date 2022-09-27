require 'yaml'
require 'logger'

namespace 'db' do
  desc "import categorie"
  task(:import_categories => :environment) do
    categories = YAML.load_file("lib/tasks/data/jxcategories.yaml")
    
    categories.each_with_index do |category, index|
      frst = category[0].to_s
      @frst = Frst.find_by_name(frst)
      if !@frst
        @frst = Frst.create(:name => frst, :sequence => index)
      else
        @frst.update_attributes(:sequence => index)
      end
    
      if !category[1].nil?
        category[1].each_with_index do |c, index|
          secd = c[0].to_s
          showstyle = c[1]
          svg = c[2]
          @secd = Secd.find_by_name(secd)
          if !@secd
            @secd = Secd.create(:name => secd, :frst => @frst, :sequence => index, :showstyle => showstyle, :svg => svg)
          else
            @secd.update_attributes(:frst => @frst, :sequence => index, :showstyle => showstyle, :svg => svg)
          end
        end
      end
    end
  end
end
