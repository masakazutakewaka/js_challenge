require_relative './test_helper'

class AppTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    App
  end

  def test_root
    get '/'
    assert last_response.ok?
  end

  def test_search
    can = { asin: "asin", category: "baby", rank: 1, dimension: "12 x 12 x 12 inches" }
    Crawler.any_instance.stubs(:parsed_result).returns(can)

    post '/search', "id" => "asin"
    assert last_response.ok?
    assert_equal true, last_response.body.include?("ASIN: asin")
    assert_equal true, last_response.body.include?("CATEGORY: baby")
    assert_equal true, last_response.body.include?("RANK: 1")
    assert_equal true, last_response.body.include?("DIMENSION: 12 x 12 x 12 inches")
  end
end
