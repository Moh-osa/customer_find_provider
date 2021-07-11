# README

This Setup except the following tools to be installed on your system:
 - docker
 - Ruby 3.0.1
 - Rails 6.1


##### 1. Check out the repository

```bash
git clone git@github.com:Moh-osa/customer_find_provider.git
```

##### 2. start docker

```bash
docker-compose up -d
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

and now the you can call the end point `localhost:3000/customer_flooring_requests/` with as `POST` 

passing the body with the following format 
```json
{
    "lat": 52.524642,
    "lng": 13.404618,
    "phone_number": "+494545415415",
    "material": "wood",
    "square_meters": 20
}
```