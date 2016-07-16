require 'spec_helper'

describe "Application" do
  before do
    OptIn.destroy_all
  end

  let(:opt_in){ FactoryGirl.create(:opt_in) }

  context "#create" do
    it "does create valid opt in" do
      post '/optins', opt_in: FactoryGirl.attributes_for(:opt_in)
      expect(OptIn.count).to eq(1)
      last_response.should be_ok
    end

    it 'does not create opt in' do
      post '/optins', :opt_in => { first_name: nil }
      last_response.should_not be_ok
    end
  end

  context '#update' do
    it 'does update opt in' do
      put "/optins/#{opt_in.id}", :opt_in => { first_name: 'Vova' }
      last_response.should be_ok
      opt_in.reload.first_name.should eq('Vova')
    end

    it 'does not update with non valid attribute' do
      put "/optins/#{opt_in.id}", :opt_in => { first_name: nil }
      last_response.should_not be_ok
    end
  end

  context '#disable' do
    it 'does disable opt in' do
      put "/optins/#{opt_in.id}/disable"
      last_response.should be_ok
      opt_in.reload.should_not be_active
    end
  end
end