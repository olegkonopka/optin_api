require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require './models/optin.rb'
require 'byebug'


before { content_type :json }

#create
post '/optins' do
  opt_in = OptIn.new(params[:opt_in])
  if opt_in.save
    status 200
    opt_in.to_json
  else
  	status 500
  	opt_in.errors.messages.to_json
  end
end

#update
put '/optins/:id' do
  opt_in = find_optin_by_id
  if opt_in
    if opt_in.update_attributes(params[:opt_in])
      status 200
      opt_in.to_json
    else
      status 500
      opt_in.to_json
    end
  else
    status 404
  end
end

#disable
put '/optins/:id/disable' do
  opt_in = find_optin_by_id
  if opt_in
    opt_in.disable!
    status 200
  else
  	status 404
  end
end

def find_optin_by_id
  OptIn.find params[:id]
end