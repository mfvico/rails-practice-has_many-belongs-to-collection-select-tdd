require 'rails_helper'

feature "Cats" do

  def create_cat_and_toy
    visit root_path
      cat = Cat.create!(
      name: "Mr. Whiskers"
    )
    toy = Toy.create!(
      name: "Major Lazors",
      cat_id: cat.id
    )
  end

  scenario 'Cats can have toys' do
    #Each Cat show page should list the toys that cat owns

    create_cat_and_toy

    click_on "Cats"
    expect(page).to have_content("Mr. Whiskers")
    click_on "Mr. Whiskers"
    expect(page).to have_content("Major Lazors")
  end

  scenario "Toys list cats" do
    #Toy index page should list the cat that owns each of the toys listed
    create_cat_and_toy
    click_on "Toys"
    expect(page).to have_content("Major Lazors")
    expect(page).to have_content("Mr. Whiskers")
  end

end
