class ChangeUrlExpirationDataType < ActiveRecord::Migration[6.0]
  def change
    change_column(:urls, :url_expiration, :datetime)
  end
end
