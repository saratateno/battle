feature 'Attack' do
  # As Player 1,
  # So I can win a game of Battle,
  # I want to attack Player 2, and I want to get a confirmation

  scenario 'Attacking player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Johnny Cash attacked Bruce Springsteen'
  end

  # As Player 1,
  # So I can start to win a game of Battle,
  # I want my attack to reduce Player 2's HP

  scenario 'reduce player 2\'s HP' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
    expect(page).not_to have_content 'Bruce Springsteen: 60 HP'
    expect(page).to have_content 'Bruce Springsteen: 50 HP'
  end
end
