# Garden Manager
Garden Manager is a web-application for planning a garden. A user can schedule
seeding based on the frost dates, determine a watering schedule based on a
forecast, and add plants to their garden to keep track of.
## Deployment
* [Heroku Deployment]()

## Technologies
Ruby on Rails
Javascript
GoogleOAuth2

## Database Schema
![Screen Shot 2022-03-01 at 6 23 38 PM](https://user-images.githubusercontent.com/79548116/156272649-c9853aa4-b373-4844-85b8-c9dcdadec331.png)

## APIs Used
  - [OpenWeather API](https://openweathermap.org/api)
  - [FarmSense API](https://www.farmsense.net/api/frost-date-api/)
  - [Google Calendar API](https://developers.google.com/calendar/api)
## Endpoints: Requests & Responses
![Screen Shot 2022-02-28 at 11 59 23 AM](https://user-images.githubusercontent.com/87674632/156042395-c00b2a73-03ef-43c6-a971-6e2f133459e8.png)
![Screen Shot 2022-02-28 at 12 01 06 PM](https://user-images.githubusercontent.com/87674632/156042623-bc3bad85-e748-4404-9688-78402386dea3.png)
![Screen Shot 2022-02-28 at 12 01 26 PM](https://user-images.githubusercontent.com/87674632/156042663-46a5e285-0005-40a8-ba66-6d8ad46a6aff.png)
![Screen Shot 2022-02-28 at 12 01 50 PM](https://user-images.githubusercontent.com/87674632/156042705-a7c98218-20de-4320-a230-f3cfbd60b97f.png)
![Screen Shot 2022-02-28 at 12 03 43 PM](https://user-images.githubusercontent.com/87674632/156042947-209531b1-abc9-47aa-914b-3a8cac222f66.png)

## Local Setup

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`
4. Run migrations: ` rails db:migrate`
6. Create an account with [OpenWeather API](https://home.openweathermap.org/users/sign_up) and request an API key
7. Create an account with [FarmSense API](https://www.farmsense.net/api/frost-date-api/)
9. Install the Figaro gem: `bundle exec figaro install`
10. Add your API key to the `application.yml` created by Figaro:
  ```rb
  OPENWEATHER_KEY: your_api_key
  FARMSENSE_KEY: your_api_key
  ```

## Running the tests
Run `bundle exec rspec` to run the test suite

## <ins>Contributors</ins>
<p>
  <img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" />
</p>

- [Parker Lockhart](https://www.linkedin.com/in/parker-lockhart/)
- [Josh Walsh](https://www.linkedin.com/in/jaw772/)
- [Joel Grant](https://www.linkedin.com/in/joelmgrant/)
- [Karan Mehta](https://www.linkedin.com/in/karan-mehta-2b706093/)
- [Darren Kulback](https://www.linkedin.com/in/darren-kulback-9b2394189/)

<p>
  <img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white" />
</p>

- [Parker Lockhart](https://github.com/ParkerLockhart)
- [Josh Walsh](https://github.com/jaw772)
- [Joel Grant](https://github.com/joel-grant)
- [Karan Mehta](https://github.com/karanm645)
- [Darren Kulback](https://github.com/dkulback)