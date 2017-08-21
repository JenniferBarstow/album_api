== README

## Album API ## 

**An API built using Rails-4.2.1 with the following features:**

* CRUD operation endpoints for music albums
* An index of Artists
* An endpoint for individual Artists that includes a listing of the artist's album(s)


### Getting Started

Fork, clone, and cd into the project directory


Install the dependencies
`bundle install`

Create Database
`rake db:create`

Run Migrations
`rake db:migrate`

Run Rake Task to import Albums from the albums.csv
`rake db:load_albums`

Start up your server!
`rails server`


### Endpoints

| Method | Endpoint | Action  |
| ----- | ------ | ----- |
| GET | /api/v1/albums| albums#index |
| GET | /api/v1/albums/:id | albums#show|
| POST| /api/v1/albums/{data} |albums#create|
| PUT | /api/v1/albums/:id/{data}|albums#update |
| DELETE | /api/v1/albums/:id | albums#delete|
| GET |/api/v1/artists |artists#index |
| GET |/api/v1/artists/:id | artists#show|


### Example Request 

POST Request:

*The following data-format will create a new album*


```{"album":{"name": "Care", "artist_id": 1, "genre": "Pop", "year": 2010}}```

### Example Response

GET Request:

*The following is an example of what a response would look like for the albums index*


```[
    {
        "id": 1,
        "name": “The Year of Hibernation",
        "genre": “Pop",
        "year": 2011,
        "artist": {
            "id": 1,
            "name": “Youth Lagoon"
        }
    },
    {
        "id": 2,
        "name": “Music To Draw To",
        "genre": “experimental",
        "year": 2017,
        "artist": {
            "id": 2,
            "name": “Kid Koala"
        }
    }
]

```



### Testing


To run tests run 
`$ rspec`