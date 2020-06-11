require 'rails_helper'

describe 'カートのテスト' do
  let(:user) { create(:user) }
  let!(:product) { create(:product) }
  let!(:cart) {create(:cart, user: user, product: product)}
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
  describe 'カート機能' do
    context '「買い物を続ける」ボタン' do
      it '商品一覧に遷移する。' do
        visit carts_path
        click_link('shop-link')
        expect(page).to have_content 'Product'
      end
    end
    context 'カートの個数変更' do
      it '合計金額が変わる。' do
        visit carts_path
        find_field('cart[number]').set("3")
        click_button '変更する'

        expect(page).to have_content '1620'
      end
    end
    context '「情報入力へ進む」をボタン' do
      it '情報入力画面に遷移する。' do
        visit carts_path
        click_link('info-link')

        expect(page).to have_content '注文情報入力'
      end
    end
  end
end