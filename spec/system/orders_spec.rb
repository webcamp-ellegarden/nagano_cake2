require 'rails_helper'

describe 'adminsログイン' do
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }
    let(:test_admin) { admin }
    let!(:order) { create(:order, user: user) }
    before do
      visit new_admin_session_path
      fill_in 'admin[email]', with: test_admin.email
      fill_in 'admin[password]', with: test_admin.password
      click_button 'ログイン'
    end
    context 'トップ画面に遷移' do
      it '注文履歴一覧と表示される' do
        expect(page).to have_content '注文履歴一覧'
      end
      it '注文履歴一覧のページ遷移に成功する' do
        click_button '注文履歴一覧'
        visit admins_orders_path
        expect(page).to have_content '購入日時'
      end
      it '注文詳細画面が表示される' do
        click_button '注文履歴一覧'
        visit admins_orders_path
        expect(page).to have_content '購入日時'
     end
     it 'ジャンル一覧に遷移できる' do
        click_button 'ジャンル一覧'
        visit admins_categories_path
        expect(page).to have_content 'ジャンル一覧'
      end
    end
  end

