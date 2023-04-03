# Train System API

This repository contains an API for a train system that allows users to create train lines, stations, and charge fares from pre-paid cards when entering and exiting stations.

## Technology Stack
This API was built using Ruby on rails, and uses a Postgresql database to store train lines, stations, cards, and ride logs.

## Setup
To run this API on your local machine, follow these steps:
- Clone this repository: `git clone git@github.com:smargozzini/train.git`
- Navigate to the cloned repository: `cd train`
- Install the required packages: `bundle install`
- Build the docker container for the database: `docker-compose up -d`
- Create the database: `rails db:create`
- Run the migrations: `rails db:migrate`
- Run the application: `rails server`


## API Endpoints

### Create Train Line

Create a train line with a name and a list of stations. The fare amount for this train line can also be optionally set.

```json

POST /train-line

Request Body:

{
"stations": ["Canal", "Houston", "Christopher", "14th"],
"name": "1",
"fare": 2.75
}

```


### Get Optimal Route

Get the optimal station list from the origin station to the destination station. The optimal station list is the fewest stations possible.

```json

GET /route?origin=[origin]&destination=[destination]

Response:

{
"route": ["Houston", "Christopher", "14th", "23rd"]
}

```

### Create Pre-paid Card

Create a new pre-paid card with a unique identification number and an initial amount of money.

```json

POST /card

Request Body:

{
"number": "1234",
"amount": 10.0
}

Response:

{
"message": "Card created successfully."
}

```

### Enter Station

Charge the fare for a ride from a pre-paid card when entering a station. Returns the amount of money left in the card after paying for the ride.

```json

POST /station/[station]/enter

Request Body:

{
"card_number": "1234"
}

Response:

{
"amount": 7.25
}

```

### Exit Station

Charge the fare for a ride from a pre-paid card when exiting a station. Returns the amount of money left in the card after paying for the ride.

```json

POST /station/[station]/exit

Request Body:

{
"card_number": "1234"
}

Response:

{
"amount": 7.25
}

```
