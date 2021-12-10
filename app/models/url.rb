require 'uri'

class Url < ApplicationRecord
    validates_presence_of :original_url
    validates :url, format: URI::regexp(["http", "https"])
    validates :url_alias, uniqueness: { case_sensitive: false, message: "The alias -- %{value} -- already exists!" }
    validates_presence_of :created_by
    validates_presence_of :url_expiration
    validates_presence_of :url_usage
    validates_length_of :original_url, within: 5..250, message: "too long"
    validates_length_of :short_url, :maximum => 20, message: "too long"
    validates_length_of :created_by, :maximum => 50
end
