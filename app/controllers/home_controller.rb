class HomeController < ApplicationController
  require 'rubygems'
  require 'koala'
  require 'oauth'
  require 'twitter'
	

  def index
   
  
   @oauth = Koala::Facebook::OAuth.new(395715373788921, "8e63cfe50d07988ade86bc603da4b068","http://localhost:3000/")
   @oauth_code =   @oauth.get_app_access_token #(:permissions => "stream_publish") # @oauth.url_for_oauth_code
   @graph = Koala::Facebook::API.new(@oauth_code)
 #          		/* Page   */
   @graph_info =  @graph.get_object("170880032923050")
   @graph_info_feed = @graph.get_connections("170880032923050", "feed")
   @graph_likes = @graph.get_connections("170880032923050", "likes")
   @graph_photos = @graph.get_connections("170880032923050", "photos")
#   render :text => 
 

#               /* Twitter Ingration */


  @client =Twitter.user("ziqqumusic")
  @user_timeline = Twitter.user_timeline("ziqqumusic")
  end
 	
  def twitter
	@client =Twitter.user("ziqqumusic")
  @user_timeline = Twitter.user_timeline("ziqqumusic")
  end
  def test
        @client =Twitter.user("ziqqumusic")
  end
end











