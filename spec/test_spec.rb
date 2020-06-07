require 'rails_helper'
RSpec.describe "Admins", type: :request do

    describe '新規投稿ページ' do
        context "新規投稿ページが正しく表示される" do
            before do
                get new_admin_registration_path
            end
            it 'リクエストは200 OKとなること' do
                expect(response.status).to eq 200
            end
        end
    end