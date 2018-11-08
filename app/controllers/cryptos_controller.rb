class CryptosController < ApplicationController
  def index
  	@crypto = StartScrap.new.perform
  end

  def search
  	@crypto = Cryptomonnaie.find_by_name(params[:name])
  	puts @crypto.value
  	end
end
