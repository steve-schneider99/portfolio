require 'rails_helper'

describe "the add a skill process" do
  it "adds a new skill" do
    visit "/"
    click_on "Login"
    fill_in 'Username', :with => 'Steve'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    visit new_skill_path
    fill_in 'name', :with => 'test skill'
    fill_in 'description', :with => 'test description'
    click_on 'Create Skill'
    expect(page).to have_content('test skill')
  end
end
