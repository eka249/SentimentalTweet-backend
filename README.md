# README

Sentimental Tweets Backend README

Ruby version 2.3.7

Sentimental Tweets backend pulls from the Twitter API, and Microsoft Sentiment Analysis API.
The Twitter API has limited calls, and therefore is a local app. A user can pick a verified celebrity or celebrities (for ethical use of the app, non verified users are exempt), and pull their tweets for that week. If multiple Twitter users are chosen, their tweets will be placed side by side on the interface.
The Microsoft API then recieves tweets and determines their "sentiment." On a scale of 0-1 (most negative to most positive), the app aims will use this data to display whether tweets that week are negatie or positive.

How to:

1. Clone the backend repo
2. Git pull origin [SSH of backend repo]
3. Clone the frontend repo (https://github.com/eka249/SentimentalTweet-frontend)
4. Git pull origin [SSH of frontend repo]
5. In the command line: rails s
6. In the command line: npm start
7. Front end located on localhost:/

- System dependencies

Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
