class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :url
      t.string :document_type
      t.date :issue_date
      t.integer :bucket_id

      t.timestamps
    end
  end
end
