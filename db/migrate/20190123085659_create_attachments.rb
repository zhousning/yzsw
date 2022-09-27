class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.timestamps null: false

      t.string :file,  null: false, default: ""
      t.references :article
      t.references :home_index
      t.references :home_index
      t.references :home_content
      t.references :home_content
    end
  end
end
