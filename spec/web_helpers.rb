def sign_in_and_play
  visit '/'
  fill_in(:player_1_name, with: 'Johnny Cash')
  fill_in(:player_2_name, with: 'Bruce Springsteen')
  click_button('Submit')
end
