require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root 
    end
    
    get '/new' do
      erv :'pirates/new'
    end
    
    post "/pirates" do
      @pirate = Pirate.new(params[:pirate])
      
      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
      @ships = Ship.assert_select_email
      
      erb :'pirates/show'
    end
        
  end
end
