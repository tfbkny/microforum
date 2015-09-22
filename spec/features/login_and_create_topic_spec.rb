require 'rails_helper' #loads the entire rails framework
require 'capybara/rails' #loads the integration test capybara
require 'capybara/rspec' # loads integration for rspec

RSpec.describe 'Login Feature', type: :feature, js:true do
  it "works" do
    # Login process
    #MUST USE ! after create to get the error which was first_name and last_name did not validate as they must be present
    # this is because we are CREATING a brand new DB entry and we CANNOT omit columns that are made mandatory
    # by the validatiion. That's how the error was found

    user = User.create!(first_name: 'John', last_name: 'Doe', email: 'jdoe123@mailinator.com', password: '123')
    visit ('/')
    expect(page.title).to eq "Microforum"
    click_link('Log In')
    expect(current_path).to eq "/login"
    fill_in('Email', with: user.email)
    fill_in('Password', with: '123')
    click_button('Log In')
#binding.pry
    expect(current_path).to eq "/sessions"
    # Create New Topic process
    #visit('/') #must add as it won't read the redidect_to root_url set in /sessions
#binding.pry
    #click_link('New Topic')

  end
end
