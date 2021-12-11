require 'uri'

class Url < ApplicationRecord
    validate :must_be_valid_url, on: :create
    validates :original_url, :created_by, :url_slug, :url_expiration, :url_usage, :short_url, presence: true
    validates :url_slug, uniqueness: { case_sensitive: false, message: "'%{value}'already exists!" } 
    validates_length_of :original_url, within: 5..250, message: "too long"
    validates_length_of :url_slug, :maximum => 20, message: "too long"
    validates_length_of :created_by, :maximum => 50

    def must_be_valid_url
        @uri = URI.parse(original_url)
        if (!@uri.is_a?(URI::HTTP) && !@uri.is_a?(URI::HTTPS))
            errors.add(:original_url, "must be a valid url")
        end
    end
end
