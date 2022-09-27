class CreateWxtools < ActiveRecord::Migration
  def change
    create_table :wxtools do |t|
    
      t.string :name,  null: false, default: Setting.systems.default_str
    
      t.string :link,  null: false, default: Setting.systems.default_str
    
      t.integer :secd_id,  null: false, default: Setting.systems.default_num 
    
      t.string :desc,  null: false, default: Setting.systems.default_str
    

    

    

    

    
      t.timestamps null: false
    end
  end
end
