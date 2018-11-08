require 'open-uri'

class StartScrap
  def initialize(url='https://coinmarketcap.com/all/views/all/')
    @url = url
    @page = Nokogiri::HTML(open(@url))
  end

  def perform

    @prices = get_prices
   Cryptomonnaie.delete_all
   save
  end


  def save
    @prices.each do |k, v|
      cryptomonnaie = Cryptomonnaie.new   
      cryptomonnaie.name = k
      cryptomonnaie.value = v
      cryptomonnaie.save
    end
  end

  def get_prices
    names = []
    values = []
    @page.css('//a[@class = "currency-name-container link-secondary"]').each do |node|
      names << node.text
    end
    @page.css('//a[@class = "price"]').each do |node|
      values << node.text
    end
    prices = Hash[names.zip(values)]
    prices
  
end
end