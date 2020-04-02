## Hostnames Application

Instructions
-----------

Make sure that you have docker and docker-compose installed. To build the app just run the command
`docker-compose up --build`. When the aplication start, you'll need to generate the database. Open a
new terminal, run the command `docker-compose run web rake db:create` to create the database and so run `docker-compose run web rails db:migrate` to up the migrations.

If you are running Docker on Linux and some permission warning appear you can try to run the command bellow:

`sudo chown -R $USER:$USER .`

Use this command to run integrations tests `docker-compose run web rails test test/controllers/host_controller_test.rb`

There is a single route that accept GET and POST methods. when the application start, it will run 
on port 3000. Bellow there are cURL call with the params to test:

- Create a new hostname:
`curl -H "Content-Type: application/json" -d '{ "dns_records": { "ip": "1.1.1.1","hostnames": ["lorem.com","dolors.com","ipsum.com"]}}' \
  -X POST http://localhost:3000/api/host`

- Get registered hostname and IP
`curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http://localhost:3000/api/host?page=1`