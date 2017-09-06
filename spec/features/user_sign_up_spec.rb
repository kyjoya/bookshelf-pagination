require 'rails_helper'

feature 'user signs up', %Q{
  As a prospective user
  I want to create an account
  So that I can post items and review them
} do

  scenario 'provides valid registration information' do
    visit root_path
    click_link 'Sign in'

    fill_in 'First name', with: "John"
    fill_in 'Last name', with: 'Miller'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content("You're in!")
    expect(page).to have_content("Sign out")
  end

  scenario 'provides invalid registration information' do
    visit root_path
    click_link 'Sign in'
    click_button 'Sign up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign out")
  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign in'

    fill_in 'First name', with: "John"
    fill_in 'Last name', with: 'Miller'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password111'
    click_button 'Sign up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign out")
  end
end
