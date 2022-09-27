class CreateHomeContents < ActiveRecord::Migration
  def change
    create_table :home_contents do |t|
    
      t.string :dtevent,  null: false, default: Setting.systems.default_str
    
      t.text :dtlink
    
      t.string :desc1,  null: false, default: Setting.systems.default_str
    
      t.string :desc2,  null: false, default: Setting.systems.default_str
    

    
      t.string :by1,  null: false, default: Setting.systems.default_str
    
      t.string :by2,  null: false, default: Setting.systems.default_str
    
      t.string :by3,  null: false, default: Setting.systems.default_str
    
      t.string :by4,  null: false, default: Setting.systems.default_str
    
      t.string :by5,  null: false, default: Setting.systems.default_str
    
      t.string :by6,  null: false, default: Setting.systems.default_str
    

    
      t.string :video,  null: false, default: Setting.systems.default_str

      t.string :video_title,  null: false, default: Setting.systems.default_str
    

    

    
      t.timestamps null: false
    end
  end
end
