feature 'Attack' do
  # As Player 1,
  # So I can win a game of Battle,
  # I want to attack Player 2, and I want to get a confirmation

  # As Player 1,
  # So I can start to win a game of Battle,
  # I want my attack to reduce Player 2's HP

  describe 'attack on player 2' do
    scenario 'first attack' do
      sign_in_and_play
      click_button 'Attack'
      expect(page).to have_content 'Johnny Cash attacked Bruce Springsteen'
    end

    scenario 'reduce player 2\'s HP' do
      sign_in_and_play
      click_button 'Attack'
      click_button 'OK'
      expect(page).not_to have_content 'Bruce Springsteen: 60 HP'
      expect(page).to have_content 'Bruce Springsteen: 50 HP'
    end
  end

  # As Player 1,
  # So I can lose a game of Battle,
  # I want Player 2 to attack me, and I want to get a confirmation

  describe 'attack on player 1' do
    scenario 'make attack' do
      sign_in_and_play
      click_button 'Attack'
      click_button 'OK'
      click_button 'Attack'
      expect(page).not_to have_content 'Johnny Cash attacked Bruce Springsteen'
      expect(page).to have_content 'Bruce Springsteen attacked Johnny Cash'
    end

    scenario 'make attack' do
      sign_in_and_play
      click_button 'Attack'
      click_button 'OK'
      click_button 'Attack'
      click_button 'OK'      
      expect(page).not_to have_content 'Johnny Cash: 60 HP'
      expect(page).to have_content 'Johnny Cash: 50 HP'
    end
  end
end
