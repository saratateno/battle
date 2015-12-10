feature 'gameplay' do

  scenario 'display whose turn it is' do
    sign_in_and_play
    expect(page).to have_content 'Johnny Cash: It is your turn!'
  end

  scenario 'allows players to take turns' do
    sign_in_and_play
    click_link 'Attack'
    click_link 'OK'
    expect(page).to have_content 'Bruce Springsteen: It is your turn!'
  end

  feature 'viewing hitpoints' do
    # As Player 1,
    # So I can see how close I am to winning
    # I want to see Player 2's Hit Points

    scenario 'viewing player 1\'s hitpoints' do
      sign_in_and_play
      expect(page).to have_content 'Johnny Cash: 60 HP'
    end

    scenario 'viewing player 2\'s hitpoints' do
      sign_in_and_play
      expect(page).to have_content 'Bruce Springsteen: 60 HP'
    end
  end
end
