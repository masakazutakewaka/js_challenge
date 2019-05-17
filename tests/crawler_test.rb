require_relative './test_helper'

class CrawlerTest < MiniTest::Test

  def setup
    Crawler.any_instance.stubs(:asin).returns("asin")
    Crawler.any_instance.stubs(:category).returns("baby")
    Crawler.any_instance.stubs(:rank).returns(1)
    Crawler.any_instance.stubs(:dimension).returns("12 x 12 x 12 inches")
    @can = { asin: "asin", category: "baby", rank: 1, dimension: "12 x 12 x 12 inches" }
  end

  def test_parse_result
    assert_equal Crawler.new('url').parsed_result, @can
  end
end
