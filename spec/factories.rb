require 'factory_girl'

FactoryGirl.define do
  sequence :email do |n|
    "optuser#{n}@example.com"
  end

  sequence :mobile do |n|
    "(063)975-50-1#{n}"
  end

  sequence :company_name do |n|
    "WebDev company#{n}"
  end

  factory :opt_in, class: OptIn do
    email
    mobile
    first_name "Oleg"
    last_name "Konopka"
    permission_type "permanent"
    channel "sms"
    company_name
  end

  factory :opt_in_two, class: OptIn do
    email "opt@com"
    mobile "252-05-56"
    first_name ""
    last_name ""
    permission_type "twice"
    channel "delivery"
    company_name ""
  end
end
