require 'rails_helper' #loads the entire rails framework
require 'capybara/rails' #loads the integration test capybara
require 'capybara/rspec' # loads integration for rspec

RSpec.describe 'Login Feature', type: :feature do
  it "works" do
    user = User.create(email: 'jdoe123@mailinator.com', password: '123')
    visit ('/')
    expect(page.title).to eq "Microforum"
    click_link('Log In')
    expect(current_url).to eq "http://www.example.com/login"
    fill_in('Email', with: user.email)
    fill_in('password', with: '123')
    click_button('Log In')
    expect(current_url).to eq "http://www.example.com/sessions"
  end
end
