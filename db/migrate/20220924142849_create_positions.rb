class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
    
      t.string :title,  null: false, default: Setting.systems.default_str
    
      t.text :content
    
      t.string :lnt,  null: false, default: Setting.systems.default_str
    
      t.string :lat,  null: false, default: Setting.systems.default_str
    
      t.string :center_lnt,  null: false, default: Setting.systems.default_str
    
      t.string :center_lat,  null: false, default: Setting.systems.default_str
    
      t.string :des1,  null: false, default: Setting.systems.default_str
    
      t.string :des2,  null: false, default: Setting.systems.default_str
    
      t.string :des3,  null: false, default: Setting.systems.default_str
    

    
      t.string :photo,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.timestamps null: false
    end
  end
end
