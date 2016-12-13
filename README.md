# Popular Hashtag Application (Web)
url: https://popularhashtags.herokuapp.com/

Sign Up fo twitter API and get ready to consume it by getting the following keys

```
CONSUMER_KEY=""
CONSUMER_SECRET=""
ACCESS_TOKEN=""
ACCESS_SECRET=""
```
ex. this project is usting DOTENV to save enviroment variables view favtag/sample.env as a sample.

## How to Deploy
** prior to set up .env
```
rake db:create && rake db:migrate
rails s
```

## How to run Tests
```
rake tests
```
