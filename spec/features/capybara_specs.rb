require 'rails_helper'

describe "the signin process", :type => :feature do
  before :each do
    User.make(email: 'pooyan@gmail.com', password: '1234')
  end

  it "signs me in" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Email', with: 'pooyan@gmail.com'
      fill_in 'Password', with: '1234'
    end
    click_button 'Log In'
    expect(page).to have_content 'Success'
  end
end