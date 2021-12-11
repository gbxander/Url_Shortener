require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  test "there are two records whose original url points to 'https://www.google.com/'" do
    urls = Url.where("original_url = 'https://www.google.com/'")
    assert_equal(2, urls.length, "there are not exactly two records whose original url points to 'https://www.google.com/'")
  end

  test "there are two records whose shortened urls were created by 'John Doe'" do
    urls = Url.where("created_by = 'John Doe'")
    assert_equal(2, urls.length, "there are not exactly two records created by 'John Doe'")
  end

  test "there are three shortened urls that have been used at least two times" do
    urls = Url.where("url_usage >= 2")
    assert_equal(3, urls.length, "there are not exatcly three shortened urls that have been used at least two times")  
  end

  test "there are two shortened urls that have expired" do
    curr_time = DateTime.now
    urls = Url.where("url_expiration < ?", curr_time)
    assert_equal(2, urls.length, "there are not exactly two shortened urls that have expired")  
  end

  test "there are five distinct original urls in the database" do
    urls = Url.all()
    original_urls = urls.map do |url|
      url.original_url
    end
    assert_equal(4, original_urls.uniq.length, "there are not exactly five distinct original urls")  
  end
end
