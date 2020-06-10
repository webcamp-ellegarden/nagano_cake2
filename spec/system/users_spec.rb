require 'rails_helper'

describe 'ユーザー認証のテスト' do
  describe 'ユーザー新規登録' do
    before do
      visit new_user_registration_path
    end
    context '新規登録画面に遷移' do
      it '新規登録に成功する' do
        fill_in 'user[family_name]', with: 'hosomi'
        fill_in 'user[first_name]', with: 'takesi'
        fill_in 'user[family_name_kana]', with: 'ホソミ'
        fill_in 'user[first_name_kana]', with: 'タケシ'
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[tel]', with: '0000000000'
        fill_in 'user[postal_code]', with: '1250041'
        select '東京', from: 'user_prefecture_code'
        fill_in 'user[address_city]', with: '葛飾区'
        fill_in 'user[address_street]', with: '東金町'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button '新規会員登録'

        expect(page).to have_content 'Product'
      end
      it '新規登録に失敗する' do
        fill_in 'user[family_name]', with: ''
        fill_in 'user[first_name]', with: ''
        fill_in 'user[family_name_kana]', with: ''
        fill_in 'user[first_name_kana]', with: ''
        fill_in 'user[email]', with: ''
        fill_in 'user[tel]', with: ''
        fill_in 'user[postal_code]', with: ''
        select '東京', from: 'user_prefecture_code'
        fill_in 'user[address_city]', with: ''
        fill_in 'user[address_street]', with: ''
        fill_in 'user[password]', with: ''
        fill_in 'user[password_confirmation]', with: ''
        click_button '新規会員登録'

        expect(page).to have_content 'error'
      end
    end
  end
  describe 'ユーザーログイン' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_user) { user }
      it 'ログインに成功する' do
        fill_in 'user[email]', with: test_user.email
        fill_in 'user[password]', with: test_user.password
        click_button 'ログイン'

        expect(page).to have_content 'Product'
      end

      it 'ログインに失敗する' do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'

        expect(current_path).to eq(new_user_session_path)
      end
    end
  end
end