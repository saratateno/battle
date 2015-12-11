feature 'Game Over' do

  context 'Player 1 attacks with full force'
    before do
      sign_in_and_play
      allow(Kernel).to receive(:rand).and_return(60)
    end

    context 'Player 2 dies' do
      before do
        attack_and_confirm
      end

      scenario 'loser message' do
        expect(page).to have_content 'Battle Over! Bruce Springsteen is dead.'
      end

      scenario 'winner message' do
        expect(page).to have_content 'Johnny Cash is the winner.'
      end
    end

end
