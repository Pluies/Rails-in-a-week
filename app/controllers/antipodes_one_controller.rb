class AntipodesOneController < ApplicationController
  def show
    #@result = request.location
    @result = Geocoder.search(params[:test]).first
    @json = '[{"lng":"'+@result.longitude.to_s+'", "lat":"'+@result.latitude.to_s+'"}]'
    #Geocoder.search("McCarren Park, Brooklyn, NY")
  end
  def reverse
    result = Geocoder.search(params[:test]).first
    lng = if result.longitude<0 then result.longitude+180 else result.longitude-180 end
    lat = -result.latitude
    @json = '[{"lng":"'+lng.to_s+'", "lat":"'+lat.to_s+'"}]'
    render "show"
  end
end
