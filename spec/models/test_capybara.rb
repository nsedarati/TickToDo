require 'rails_helper'
require 'spec_helper'

describe "the signin process", :type => :feature do
  before :each do
    User.create(email: 'pooyan@gmail.com', password: '1234')
  end

  it "signs me in" do
    visit '/sessions/new'
      fill_in 'Email', with: 'pooyan@gmail.com'
      fill_in 'Password', with: '1234'
      click_button 'Log In'
      visit "/users"
  end
end


