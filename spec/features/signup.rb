require 'rails_helper' #loads the entire rails framework
require 'capybara/rails' #loads the integration test capybara
require 'capybara/rspec' # loads integration for rspec

RSpec.describe 'Signup Feature', type: :feature do
  it "works" do
    visit ('/')
    click_link('Sign Up')
    expect(current_url).to eq "http://www.example.com/signup"
    fill_in('First name', with: "John")
    fill_in('Last name', with:'Doe')
    fill_in('Email', with:'jdoe123@mailinator.com')
    fill_in('Password', with:'123')
    fill_in('Password confirmation', with:'123')
    click_button('Create User')
    expect(current_url).to eq "http://www.example.com/"
  end
end
