require 'rails_helper'
RSpec.describe "Admins", type: :request do

  describe 'asminログインページ' do
    context "ログインページが正しく表示される" do
      before do
        get new_admin_session_path
      end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
    end
  end
  describe '詳細画面のテスト' do
    before do
      visit admins_products_path
    end
    context '表示の確認' do
      it '商品新規登録が表示される' do
        expect(page).to have_content(product_price)
      end
    end
  end


  describe 'asminログイン' do
    let(:admin) { create(:admin) }
      before do
        get new_admin_session_path
      end
      context 'ログイン画面に遷移' do
        let(:test_admin) { admin }
          it 'ログインに成功する' do
            fill_in 'admin[email]', with: test_admin.email
            fill_in 'admin[password]', with: test_admin.password
            click_button 'ログイン'
            expect(page).to have_content '本日の注文件数'
         end
    end
  end
end