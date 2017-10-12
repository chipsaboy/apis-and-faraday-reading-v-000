class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
        req.params['client_id'] = 'YZR2XMSV11KIOZDKSUTIWA5KHDOALKJU5T0IH22CTTZ32D33'
        req.params['client_secret'] = 'DNGIKEM0AR2I4BOTJGVOK2QC2GDMD4YGCACDVOPAU512DCHC'
        req.params['v'] = '20160201'
        req.params['near'] = params[:zipcode]
        req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
end
