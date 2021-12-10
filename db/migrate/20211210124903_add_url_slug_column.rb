class AddUrlSlugColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :url_slug, :string
  end
end
