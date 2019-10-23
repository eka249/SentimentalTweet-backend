class CelebsController < ApplicationController

    
    def index
        @celebs = Celeb.all
        render json: celebs
    end

    def show
        @celeb = Celeb.find(params[:id])
        render json: celeb
    end

    def create
    end

    def get_celeb
        # refer to:
        # https://github.com/sferik/twitter
        client = 
            Twitter::REST::Client.new do |config|
            config.consumer_key= "#{ENV["consumer_key"]}"
            config.consumer_secret = "#{ENV["consumer_secret"]}"
            config.access_token= "#{ENV["access_token"]}"
            config.access_token_secret = "#{ENV["access_token_secret"]}"
        end
        client.user("gem")
        celeb_results = client.user(
            "realDonaldTrump" , 
            # {[:celeb]}
            #^add proper params name
            result_type: "recent").take(10).collect do |tweet|
                "#{tweet.user.screen_name}: #{tweet.text}"
            end
            
        celeb_results_for_sentiment = {
            "documents" : [
                
                    celeb_results.each do |result|
                       { "language":"en",
                        "id" : "1",
                        "text": "#{result}"
                       }
                       Tweet.new(content: result, celeb_username: "realDonaldTrump", sentiment: "")
                    end
            ]}

            }

            
        #celeb_results_for_sentiment_api.split
        #continue parsing this when I have more sleep

        RestClient.get("https://westus.api.cognitive.microsoft.com/text/analytics/v2.1/sentiment"
        Ocp-Apim-Subscription-Key: "ENV#{COGNITIVE_SERVICE_KEY}"
        #do we need this after running .bash_profile?
        Host: westus.api.cognitive.microsoft.com
        Content-Type: application/json
        "#{celeb_results_for_sentiment_api}"
        #refer to https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-call-api
        # and 
        # https://docs.microsoft.com/en-us/azure/cognitive-services/cognitive-services-apis-create-account?tabs=multiservice%2Cunix#get-the-keys-for-your-resource



        # render :json => @celeb_results
        # depending on the output type?? going to assume it's an array for now
        
        # patch tweet db when I can sign in and know the content
    end


    def destroy
    end
end
