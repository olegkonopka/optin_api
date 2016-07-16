configure :development do
  set :database, "postgresql:optin_db"
end

configure :test do
  set :database, "postgresql:optin_db_test"
end