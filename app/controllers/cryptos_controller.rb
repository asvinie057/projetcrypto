class CryptosController < ApplicationController
  def index
  	@crypto = StartScrap.new.perform
  end
end
