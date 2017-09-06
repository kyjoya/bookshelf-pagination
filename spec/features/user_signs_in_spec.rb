require 'rails_helper'

feature 'user signs in' do
  scenario 'user signs in'

  scenario 'nonexistent email and passowrd is supplied'
  scenario 'user signs in with email and wrong password'
  scenario 'existing user cannot sign in twice'
end
