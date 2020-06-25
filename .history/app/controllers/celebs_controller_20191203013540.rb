class CelebsController < ApplicationController
    require 'net/https'
    require 'uri'
    require 'json'
    require 'twitter'
    
    def index
        puts "hit get_celeb"
        @celebs = Celeb.all
        render json: @celebs
    end

    def show
        @celeb = Celeb.find(params[:id])
        render json: @celeb
    end

    #currently have a get celebs as friends and used to have one by username
    def get_all_celebs
        # puts "hit get_celeb"
        # client = 
        #     Twitter::REST::Client.new do |config|
        #     config.consumer_key= "#{ENV["CONSUMER_KEY"]}"
        #     config.consumer_secret = "#{ENV["CONSUMER_SECRET"]}"
        #     config.access_token= "#{ENV["ACCESS_TOKEN_KEY"]}"
        #     config.access_token_secret = "#{ENV["ACCESS_TOKEN_SECRET"]}"
        # end
        # @celeb_results = client.friends(
        #     result_type: "recent")
        #     .each do |tweet|
        #         [tweet]
        #     end
        #     render json: @celeb_results
        #     # puts "twitter restuls below"
        #     puts @celeb_results

        client = 
            Twitter::REST::Client.new do |config|
            config.consumer_key= "#{ENV["CONSUMER_KEY"]}"
            config.consumer_secret = "#{ENV["CONSUMER_SECRET"]}"
            config.access_token= "#{ENV["ACCESS_TOKEN_KEY"]}"
            config.access_token_secret = "#{ENV["ACCESS_TOKEN_SECRET"]}"
        end
        # @celeb_results = client.search(
        #     # "by: "+ params[:celebrity],
        #     "by: justinbie",
        #     #^add proper params name
        #     result_type: "recent").take(3).collect do |tweet|
        #         [
        #         "#{tweet.full_text}", "#{tweet.user.screen_name}"]
        #     end
        #     render json: @celeb_results
            
        @user_results = client.user_search("justinbieber")
        # .take(1).each do |user| 
        # puts "user.screen_name"
        # end
        render json: @user_results
        end


         
        # sentiment_temp = []
        # puts "sentiment temp array"
        # puts sentiment_temp
        # puts "after sentiment"
      
    
        #     @celeb_results.each do |result|
        #     sentiment_temp.push( {"language":"en",
        #     "id":"1",
        #     "text":"#{result[0]}"
        #     })
        #     Tweet.new(content: result[0], celeb_username: result[1], sentiment: "")
        #     end
        #     render json: celeb_results
        #     puts "sentiment temp array after manipulation"
        #     puts celeb_results


        #     celeb_results_for_sentiment = {"documents" => sentiment_temp}

        #     # CelebsController.sent_analysis(celeb_results_for_sentiment)
        
        #     # fakeTweet = Tweet.new(content: "Hey this is a test tweet" ,sentiment: 0.7 , date: "10/23/10" ,celeb_username: "realDonaldTrump")

        #     # fakeTweet2 = Tweet.new(content: "second test tweet ;asdoifnsd;flienslrknselrknserlkerelrksjrelrirjeslrisjelivjoishdfnsa;/" , sentiment: 0.1  , date: "10/23/18" , celeb_username: "realDonaldTrump")

        #     # return [fakeTweet, fakeTweet2]
        
           
        # RestClient.get("https://westus.api.cognitive.microsoft.com/text/analytics/v2.1/sentiment")

        #refer to https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-call-api
        # https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account?tabs=multiservice%2Cunix#get-the-keys-for-your-resource    

    def sent_analysis
        key_var = "TEXT_ANALYTICS_SUBSCRIPTION_KEY"
        if (!ENV[key_var])
            raise "Please set/export the following environment variable: " + key_var
        else
            subscription_key = ENV[key_var]
        end

        endpoint_var = "TEXT_ANALYTICS_ENDPOINT"
        if (!ENV[endpoint_var])
            raise "Please set/export the following environment variable: " + endpoint_var
        else
            endpoint = ENV[endpoint_var]
        end

        path = '/text/analytics/v2.1/sentiment'

        uri = URI(endpoint + path)

        documents = celeb_results_for_sentiment
        

        puts 'Please wait a moment for the results to appear.'

        request = Net::HTTP::Post.new(uri)
        request['Content-Type'] = "application/json"
        request['Ocp-Apim-Subscription-Key'] = subscription_key
        request.body = documents.to_json

        response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request (request)
        end

        puts JSON::pretty_generate (JSON (response.body))
    end
    #refer to https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/quickstarts/ruby for syntax

    def destroy
    end
end
