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
    end
    context 'ジャンル一覧に遷移' do
      it '投稿し、追加したジャンルを表示する' do
        visit admins_categories_path
        fill_in 'category[name]',with: '和菓子'
        click_on '追加'
        expect(page).to have_content "和菓子"
      end
      it 'ヘッダーから商品一覧へのリンクを押下する' do
        visit admins_categories_path
        click_button '商品一覧'
        visit admins_products_path
        expect(page).to have_content "Product index"
      end
    end
  end

   describe '商品一覧のテスト' do
    let(:product) { create(:product)}
    let(:user) { create(:user)}
    let(:admin) { create(:admin) }
    let(:test_admin) { admin }
    let!(:order) { create(:order, user: user)}
    let!(:order_detail) {create(:order_detail, order: order)}

    before do
      visit new_admin_session_path
      fill_in 'admin[email]', with: test_admin.email
      fill_in 'admin[password]', with: test_admin.password
      click_button 'ログイン'
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
      it '登録した商品が表示される' do
        visit new_admins_product_path
        fill_in 'product[product_name]', with: Faker::Lorem.characters(number:5)
        fill_in 'product[product_price]', with: '500'
        fill_in 'product[product_comment]', with: Faker::Lorem.characters(number:40)
        select "販売中", from: 'product_product_status'
        select '和菓子', from: 'product_category_id'
        click_on '投稿する'
        click_button '商品一覧'
        visit admins_products_path
        expect(page).to have_content '500'
      end
      it '商品新規登録画面が表示される(2商品目)' do
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
        select '和菓子', from: 'product_category_id'
        click_on '投稿する'
        expect(page).to have_content '商品詳細'
      end
      it '商品詳細画面でヘッダの商品一覧を押す' do
        visit admins_product_path(product)
        click_button '商品一覧'
        visit admins_products_path
        expect(page).to have_content 'Product index'
      end
      it '商品一覧画面でヘッダのログアウトボタンを押す' do
        visit admins_products_path
        click_button 'Log Out'
        visit admins_products_path
        expect(page).to have_content 'Product index'
      end
      it '注文履歴詳細を表示する' do
        visit admins_orders_path
        click_on 'order_link1'
        expect(page).to have_content '注文履歴詳細'
      end
        it '注文ステータスが入金確認の時、製作ステータスが製作待ちになる' do
        visit admins_order_path(order)
        select '入金確認', from: 'order_order_status'
        click_on 'order_link1'
        visit admins_order_path(order)
        expect(page).to have_content '製作待ち'
      end
      it '製作ステータスが製作中の時、注文ステータスが製作中になる' do
        visit admins_order_path(order)
        select '製作中', from: 'order_detail_making_status'
        click_on 'order_detail_link1'
        visit admins_orders_path
        expect(page).to have_content '製作中'
      end
      it '製作ステータスが製作完了の時、注文ステータスが発送待ちになる' do
        visit admins_order_path(order)
        select '製作完了', from: 'order_detail_making_status'
        click_on 'order_detail_link1'
        visit admins_orders_path
        expect(page).to have_content '発送準備中'
      end
      it '注文ステータスを発送済みに更新する' do
        visit admins_order_path(order)
        select '発送完了', from: 'order_order_status'
        click_on 'order_link1'
        visit admins_orders_path
        expect(page).to have_content '発送完了'
      end
    end
  end





