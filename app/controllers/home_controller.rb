class HomeController < ApplicationController
  require 'rubygems'
 require 'koala'

  def index
   
   @oauth = Koala::Facebook::OAuth.new(395715373788921, "8e63cfe50d07988ade86bc603da4b068","http://localhost:3000/")
   @oauth_code =   @oauth.get_app_access_token #(:permissions => "stream_publish") # @oauth.url_for_oauth_code
   @graph = Koala::Facebook::GraphAPI.new(@oauth_code)
 #          		/* Page   */
   @graph_info =  @graph.get_object("170880032923050")
   @graph_info_feed = @graph.get_connections("170880032923050", "feed")
   @graph_likes = @graph.get_connections("170880032923050", "likes")
   @graph_photos = @graph.get_connections("170880032923050", "photos")
   #render :text => session[:access_token]

  end
 
 
  
  def callback
         
  	if params[:code]
		session[:access_token] = '' 
  		# acknowledge code and get access token from FB
		  session[:access_token] = session[:oauth].get_access_token(params[:code])
	end		

		 # auth established, now do a graph call:
		  
		@api = Koala::Facebook::API.new(session[:access_token])
	begin
			#@graph_data = @api.get_object("/me/statuses", "fields"=>"message")
			@graph_like = @api.put_post("100001548409455","feed", "This is My first Post")
	rescue Exception=>ex
			puts ex.message
	end
		
#  redirect_to index
               
		
	
  end

  def test

	@oauth = Koala::Facebook::OAuth.new(395715373788921, "8e63cfe50d07988ade86bc603da4b068","http://localhost:3000/")
  	@oauth_code =   @oauth.get_app_access_token #(:permissions => "stream_publish") # @oauth.url_for_oauth_code
  	@graph = Koala::Facebook::GraphAPI.new(@oauth_code)
        @graph_info_feed = @graph.get_connections("170880032923050", "feed")

     #  render :text => @graph_info_feed.first(4)
    
   end
end
