require 'nokogiri'
require 'open-uri'

class Crawler
  class NotFoundError < StandardError; end
  class ParseError < StandardError; end

  ASIN_XPATH = "//div[@class='column col2 ']//tr[1]/td[@class='value']"
  CATEGORY_XPATH = "//div[@id='wayfinding-breadcrumbs_container']//li[1]/span[@class='a-list-item']/a"
  RANK_XPATH = "//tr[@id='SalesRank']/td[@class='value']"
  DIMENSION_XPATH = "//tr[@class='size-weight'][2]/td[@class='value']"

  def initialize(url)
    @url = url
  end

  def parsed_result
    { asin: asin, category: category, rank: rank, dimension: dimension }
  end

  private

  def asin
    parse(ASIN_XPATH).content
  end

  def category
    parse(CATEGORY_XPATH).content.strip
  end

  def rank
    parse(RANK_XPATH).content.match(/\#(\d+)/)[1].to_i
  end

  def dimension
    parse(DIMENSION_XPATH).content
  end

  def parse(xpath)
    elements = doc.xpath(xpath)
    raise ParseError if elements.empty?
    elements.first
  end

  def doc
    @doc ||= Nokogiri::HTML(open(@url, { "User-Agent" => '' })) # need User-Agent to go through FireWall
  rescue OpenURI::HTTPError
    raise NotFoundError
  end
end
