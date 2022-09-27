class CreateEngines < ActiveRecord::Migration
  def change
    create_table :engines do |t|
    
      t.string :template,  null: false, default: Setting.systems.default_str
    
      t.boolean :consult,  null: false, default: Setting.systems.default_boolean
    
      t.string :point,  null: false, default: Setting.systems.default_str
    
      t.string :des1,  null: false, default: Setting.systems.default_str
    
      t.string :des2,  null: false, default: Setting.systems.default_str
    
      t.boolean :des3,  null: false, default: Setting.systems.default_boolean
    

    
      t.string :logo,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.timestamps null: false
    end
  end
end
