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

describe '注文のテスト' do
  let(:user) { create(:user) }
  let!(:product) { create(:product) }
  let!(:cart) {create(:cart, user: user, product: product)}
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
    context '情報入力画面の表示' do
      it '注文情報入力が表示される' do
        visit carts_path
        click_link('info-link')

        expect(page).to have_content '注文情報入力'
      end
    end
    context '情報入力' do
      before do
        visit carts_path
        click_link('info-link')
      end
      it '支払い方法を選択できる' do
        choose('order_payment_銀行振り込み')
      end
      it '登録済み住所を選択できる' do
        choose('option_1')
      end
      it '確認画面に遷移する' do
        click_button '確認画面に進む'

        expect(page).to have_content '注文情報確認'
      end
    end
    context '注文情報確認' do
      before do
        visit carts_path
        click_link('info-link')
        choose('order_payment_銀行振り込み')
        choose('option_1')
        click_button '確認画面に進む'
      end
      it '商品が表示される' do
        expect(page).to have_content '540'
      end
      it '支払い方法が表示される' do
        expect(page).to have_content '銀行振り込み'
      end
      it '請求金額が表示される' do
        expect(page).to have_content '1880'
      end
      it 'サンクスページに遷移する' do
        click_button '購入を確定する'

        expect(page).to have_content '注文を受け付けました。'
      end
    end
    context 'マイページのリンク' do
      it '注文履歴のリンクが表示される' do
        visit user_path(user)
        click_link 'orders_link'

        expect(page).to have_content '注文履歴一覧'
      end
    end
    context '注文履歴のテスト' do
      before do
        visit carts_path
        click_link('info-link')
        choose('order_payment_銀行振り込み')
        choose('option_1')
        click_button '確認画面に進む'
        click_button '購入を確定する'
        visit orders_path
        click_link '表示する'
      end
      it '注文詳細ページへ遷移' do
        expect(page).to have_content '注文履歴詳細'
      end
       it '注文内容が表示されている' do
        expect(page).to have_content '1880'
      end
      it '入金待ちになっている' do
        expect(page).to have_content '入金待ち'
      end
    end
end

