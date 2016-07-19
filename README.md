Sinatra Api for Opt-In
Run Application:
1.Gem instalation: bundle install
2.Create database: rake db:create rake db:migrate
3.Create database for Test: rake db:create RACK_ENV=test rake db:migrate RACK_ENV=test 
4.Run tests: rspec spec
5.Run application: ruby application.rb