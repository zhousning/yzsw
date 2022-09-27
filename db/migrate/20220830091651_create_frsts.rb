class CreateFrsts < ActiveRecord::Migration
  def change
    create_table :frsts do |t|
    
      t.string :name,  null: false, default: Setting.systems.default_str
    
      t.integer :sequence,  null: false, default: Setting.systems.default_num 
    
      t.boolean :index_page,  null: false, default: Setting.systems.default_boolean
    
      t.boolean :show_page,  null: false, default: Setting.systems.default_boolean
    

    
      t.string :sidebar,  null: false, default: Setting.systems.default_str
    
      t.string :header,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.timestamps null: false
    end
  end
end
