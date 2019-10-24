class CelebsController < ApplicationController
    require 'net/https'
    require 'uri'
    require 'json'
    require 'twitter'
    
    def index
        celebs = Celeb.all
        render json: celebs
    end

    def show
        @celeb = Celeb.find(params[:id])
        render json: celeb
    end

    def get_celeb
        puts "hit get_celeb"
        puts params
        puts params[:celebrity]
        client = 
            Twitter::REST::Client.new do |config|
            config.consumer_key= "#{ENV["CONSUMER_KEY"]}"
            config.consumer_secret = "#{ENV["CONSUMER_SECRET"]}"
            config.access_token= "#{ENV["ACCESS_TOKEN_KEY"]}"
            config.access_token_secret = "#{ENV["ACCESS_TOKEN_SECRET"]}"
        end
        celeb_results = client.search(
            params[:celebrity] , 
            #^add proper params name
            result_type: "recent").take(3).collect do |tweet|
                [
                "#{tweet.text}", "#{tweet.user.screen_name}"]
            end
            
    
        sentiment_temp = []
    
        celeb_results.each do |result|
            sentiment_temp.push( {"language":"en",
            "id":"1",
            "text":"#{result[0]}"
            })
            Tweet.new(content: result[0], celeb_username: result[1], sentiment: "")
        end


        celeb_results_for_sentiment = {"documents" => sentiment_temp}
            
        # RestClient.get("https://westus.api.cognitive.microsoft.com/text/analytics/v2.1/sentiment"
        # Ocp-Apim-Subscription-Key:"ENV#{COGNITIVE_SERVICE_KEY}"
        # #do we need this after running .bash_profile?
        # Host: "#{ENV[TEXT_ANALYTICS_SUBSCRIPTION_KEY"]}
        # Content-Type:application/json
        # "#{celeb_results_for_sentiment_api}")
        # #refer to https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-call-api
        # # and 
        # # https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account?tabs=multiservice%2Cunix#get-the-keys-for-your-resource    

    end

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