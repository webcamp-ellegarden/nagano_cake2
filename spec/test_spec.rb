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
      get root_path
    end
    context '表示の確認' do
      it '商品新規登録が表示される' do
        expect(page).to have_content(PICK UP)
      end
    end
  end


  describe 'asminログイン' do
    let(:admin) { FactoryBot.create(:admin) }
      before do
        get new_admin_session_path
        click_button 'Log in'
      end
      context 'ログイン画面に遷移' do
        let(:test_admin) { admin }
          it 'ログインに成功する' do
            post 'admins/sign_in', email: admin.email, password: admin.password
            click_button 'ログイン'
            expect(page).to have_content '本日の注文件数'
         end
    end
  end
end