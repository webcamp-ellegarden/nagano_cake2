require 'rails_helper'

RSpec.describe "admins/users/index", type: :view do
  describe 'index.html.erbのテスト' do
    it 'h1タグ内にUsersが表示されているかどうか' do
      get admins_users_path
      expect(response).to have_http_status(200)
    end
  end
end

