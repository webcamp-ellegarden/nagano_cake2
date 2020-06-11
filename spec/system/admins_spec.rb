require 'rails_helper'

describe 'adminsログイン' do
    let(:admin) { create(:admin) }
    before do
      visit new_admin_session_path
    end
    context 'ログイン画面に遷移' do
      let(:test_admin) { admin }
      it '管理者トップ画面が表示される' do
        fill_in 'admin[email]', with: test_admin.email
        fill_in 'admin[password]', with: test_admin.password
        click_button 'ログイン'

        expect(page).to have_content '管理者画面'
      end

      it 'ログインに失敗する' do
        fill_in 'admin[email]', with: ''
        fill_in 'admin[password]', with: ''
        click_button 'ログイン'

        expect(current_path).to eq(new_admin_session_path)
      end
    end
  end

describe 'adminsログイン' do
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }
    let(:test_admin) { admin }
    let(:category) {create(:category) }
    let!(:order) { create(:order, user: user) }
    before do
      visit new_admin_session_path
      fill_in 'admin[email]', with: test_admin.email
      fill_in 'admin[password]', with: test_admin.password
      click_button 'ログイン'
    end
    context 'トップ画面に遷移' do
      it 'ジャンル一覧に遷移できる' do
        click_button 'ジャンル一覧'
        visit admins_categories_path
        expect(page).to have_content 'ジャンル一覧'
      end
    context 'ジャンル一覧に遷移' do
      it 'ジャンルを投稿できる' do
        visit admins_categories_path
        click_on '追加'
        expect(page).to have_content "ジャンル一覧"
      end
    end
  end

   describe '商品一覧のテスト' do
    let(:product) { create(:product) }
    let(:category) { category }
    before do
      visit admins_homes_top_path
    end
    context '商品一覧の表示' do
      it '商品一覧が表示される' do
        click_button '商品一覧'
        visit admins_products_path
        expect(page).to have_content '商品一覧'
      end
      it '商品新規登録画面が表示される' do
        visit admins_products_path
        click_on 'New product'
        visit new_admins_product_path
        expect(page).to have_content '商品新規投稿画面'
      end
      it '商品新規登録ボタンを押すと登録した商品の詳細画面へ遷移する' do
        visit new_admins_product_path
        fill_in 'product[product_name]', with: Faker::Lorem.characters(number:5)
        fill_in 'product[product_price]', with: '500'
        fill_in 'product[product_comment]', with: Faker::Lorem.characters(number:40)
        select "販売中", from: 'product_product_status'
        select 'ケーキ', from: 'category_category_status'
        click_on '投稿する'
        expect(page).to have_content '商品詳細'
      end
    end
  end
end


