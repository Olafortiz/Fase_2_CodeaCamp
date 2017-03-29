class UrlsController < ApplicationController
  
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    short_url = Url.generate_url
    p params
    long_url = params[:url][:long_url]
    new_url = Url.new(long_url: long_url, short_url: short_url)

    if new_url.save
      redirect_to :action => :index
    else
      redirect_to '/new'
    end  
  end

  def show
    @url = Url.find([:id])
  end 
  
  def short_url
    @url =  Url.find_by(short_url: params[:short_url])
    visitas = @url.click_count + 1
    @url.update(click_count: visitas)
    redirect_to(@url.long_url)
  end

  def destroy
  end

end
