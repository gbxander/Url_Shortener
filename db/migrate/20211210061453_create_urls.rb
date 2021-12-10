class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :short_url
      t.integer :url_expiration
      t.integer :url_usage
      t.string :created_by

      t.timestamps
    end
  end
end
