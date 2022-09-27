class CreateWxNatures < ActiveRecord::Migration
  def change
    create_table :wx_natures do |t|
      t.string :name
      t.string :data_type
      t.string :title
      t.string :tag
      t.boolean :required

      t.references :wx_template

      t.timestamps null: false
    end
  end
end
