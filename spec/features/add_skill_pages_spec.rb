require 'rails_helper'

describe "the add a skill process" do
  it "adds a new skill" do
    visit skills_path
    click_on "Add a new Skill"
    fill_in 'Name', :with => 'test skill'
    fill_in 'Description', :with => 'test description'
    click_on 'Create Skill'
    expect(page).to have_content 'test skill'
  end
end
