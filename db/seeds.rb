# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
mock_valid_date = "2050-01-01 01:01:01 UTC"
mock_expired_date = "2020-01-01 01:01:01 UTC"

Url.destroy_all()

Url.create!(:original_url => "https://www.yahoo.com/", :short_url => "www.miniurl.com/urls/yahoo", :url_slug => "yahoo", :url_expiration => mock_valid_date, :url_usage => 0, :created_by => "John Doe")
Url.create!(:original_url => "https://www.google.com/", :short_url => "www.miniurl.com/urls/goog1", :url_slug => "goog1", :url_expiration => mock_valid_date, :url_usage => 2, :created_by => "Neo")
Url.create!(:original_url => "https://www.google.com/", :short_url => "www.miniurl.com/urls/goog2", :url_slug => "goog2", :url_expiration => mock_expired_date, :url_usage => 3, :created_by => "John Doe")
Url.create!(:original_url => "https://github.com/", :short_url => "www.miniurl.com/urls/git", :url_slug => "git", :url_expiration => mock_valid_date, :url_usage => 1, :created_by => "Linus")
Url.create!(:original_url => "https://www.wikipedia.org/", :short_url => "www.miniurl.com/urls/wiki", :url_slug => "wiki", :url_expiration => mock_expired_date, :url_usage => 3, :created_by => "Alan Turing")
