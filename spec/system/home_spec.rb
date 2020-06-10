require 'rails_helper'

describe 'トップページのテスト' do
  describe 'リンクの確認' do
    before do
      visit root_path
    end
    context '新規登録画面に遷移' do
      it '遷移に成功する' do
        click_button 'Log In'
        click_on '新規登録'

        expect(page).to have_content '新規会員登録'
      end
    end
  end
 end