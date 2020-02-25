require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit games_url
  #
  #   assert_selector "h1", text: "Game"
  # end
  test "Going to /new gives us a new random grid to play with" do
    visit new_url
    assert test: "New game"
    assert_selector "li", count: 10
  end

  test "Checking if the filled in word is an english word"
    visit score_url
    page.fill_in 'word', with: 'apple'
    click_on('.button')
  end

  test "Checking if filled in word is a valid word considering the given letters"
    visit score_url
    page.fill_in 'word', with: 'be'
    click_on('.button')
  end

  test "Checking if filled in word is not an english word"
    visit score_url
    page.fill_in 'word', with: 'asdlkjfka'
    click_on('.button')
  end

end
