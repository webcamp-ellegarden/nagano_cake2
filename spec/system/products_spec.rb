require 'rails_helper'

describe '商品のテスト' do
  let(:user) { create(:user) }
  let!(:product) { create(:product) }
  let!(:product2) { create(:product) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
  describe '商品一覧～注文のテスト' do
    context '商品一覧画面のテスト' do
      it 'ログイン後、商品一覧に遷移' do
        expect(page).to have_content 'Product'
      end
      it '詳細画面に遷移する。' do
        click_link('product_link1')

         expect(page).to have_content '消費期限'
      end
    end
    context '商品詳細画面のテスト' do
      it 'カート画面に遷移する。' do
        fill_in 'cart_number', with: '2'
        click_button 'button'

        expect(page).to have_content 'ショッピングカート'
      end
    end
 end
end