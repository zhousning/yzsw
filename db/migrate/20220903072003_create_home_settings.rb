class CreateHomeSettings < ActiveRecord::Migration
  def change
    create_table :home_settings do |t|
    
      t.text :diyi
    
      t.text :dangjian
    
      t.text :dier
    
      t.text :disan
    

    
      t.string :logo,  null: false, default: Setting.systems.default_str
    
      t.string :avatar,  null: false, default: Setting.systems.default_str
    
      t.string :photo,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.timestamps null: false
    end
  end
end
