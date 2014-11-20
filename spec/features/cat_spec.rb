require 'rails_helper'

feature "Cats" do

  scenario 'Cats can have toys' do
    #Each Cat show page should list the toys that cat owns

    visit root_path
      cat = Cat.create!(
      name: "Mr. Whiskers"
    )
    toy = Toy.create!(
      name: "Major Lazors",
      cat_id: cat.id
    )
    click_on "Cats"
    expect(page).to have_content("Mr. Whiskers")
    click_on "Mr. Whiskers"
    expect(page).to have_content("Major Lazors")
  end

end
