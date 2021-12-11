json.extract! url, :id, :original_url, :short_url, :url_slug, :url_expiration, :url_usage, :created_by, :created_at, :updated_at
json.url url_url(url, format: :json)
