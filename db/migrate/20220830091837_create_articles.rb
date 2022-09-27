class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    
      t.string :title,  null: false, default: Setting.systems.default_str
    
      t.date :pdt_date
    
      t.text :content

      t.text :raw_content
    
      t.text :wxlink

    

    

    
      t.references :secd
    

    
      t.timestamps null: false
    end
  end
end
