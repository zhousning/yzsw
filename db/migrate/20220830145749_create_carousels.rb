class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
    
      t.string :title,  null: false, default: Setting.systems.default_str
    
      t.integer :sequence,  null: false, default: Setting.systems.default_num 
    

    
      t.string :photo,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.timestamps null: false
    end
  end
end
