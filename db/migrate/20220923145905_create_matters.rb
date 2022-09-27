class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
    
      t.string :title,  null: false, default: Setting.systems.default_str
    
      t.string :background,  null: false, default: Setting.systems.default_str
    
      t.string :link,  null: false, default: Setting.systems.default_str
    
      t.integer :sequence,  null: false, default: Setting.systems.default_num 
    
      t.string :icon,  null: false, default: Setting.systems.default_str
    

    
      t.string :logo,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.timestamps null: false
    end
  end
end
