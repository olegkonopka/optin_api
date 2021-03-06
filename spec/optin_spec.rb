require 'spec_helper'

describe OptIn do
  before do
    OptIn.destroy_all
  end
  
  let(:opt_in){ create :opt_in }
  let(:opt_in_two){ create :opt_in_two }

  it "does be valid" do
    optin = build :opt_in
    expect(optin.save).to eq(true)
  end

  it "does not be valid" do
    optin = build :opt_in_two
    expect(optin.save).to_not eq(true)
  end

  it "does render error messages" do
    optin = build :opt_in_two
    expect(optin.save).to eq(false)
    %w(email mobile first_name last_name permission_type channel company_name).each do |key|
      expect(optin.errors[key]).to be_present
    end
  end

  it "does disable model" do
    expect { opt_in.disable! }.to change(opt_in, :active?).from(true).to(false)
  end
end