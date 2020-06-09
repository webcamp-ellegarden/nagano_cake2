require 'rails_helper'

describe 'ユーザーログインのテスト' do
  before do
  	visit new_user_session_path
  end
  context 'ログイン画面に遷移' do 
    it 'ログインに成功する。' do
    	fill_in 'user[email]', with: 'foo5@hoge'
    	fill_in 'user[password]', with: 'password'
    	click_button 'Log in'

    	expect(page).to have_content 'Product'
    end
  end
end