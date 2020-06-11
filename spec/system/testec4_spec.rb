require 'rails_helper'

describe '④登録情報編集～退会' do
	let(:admin) { create(:admin) }
	let!(:user) { create(:user) }
  let!(:product) { create(:product) }
	before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end
	describe '・マイページのテスト' do
		before do
			visit user_path(user)
		end
		context '会員情報編集のリンク' do
			it '会員情報編集画面に遷移する。' do
        click_link '編集する'

        expect(page).to have_content '登録情報編集'
			end
		end
		context '配送先一覧のリンク' do
			it '配送先一覧に遷移する。' do
        click_link 'delivery_link'

        expect(page).to have_content '配送先登録'
			end
		end
	end

	describe '・会員情報編集' do
		before do
			visit edit_user_path(user)
			fill_in 'user[family_name]', with: 'noda'
      fill_in 'user[first_name]', with: 'yojiro'
      fill_in 'user[family_name_kana]', with: 'ノダ'
      fill_in 'user[first_name_kana]', with: 'ヨウジロウ'
      fill_in 'user[email]', with: Faker::Internet.email
      fill_in 'user[tel]', with: '0000000000'
      fill_in 'user[postal_code]', with: '1250041'
      select '東京', from: 'user_prefecture_code'
      fill_in 'user[address_city]', with: '葛飾区'
      fill_in 'user[address_street]', with: '東金町'

      click_button '編集内容を保存する'
		end
		context '編集内容の保存' do
			it 'マイぺージに遷移する' do
				expect(page).to have_content 'マイページ'
			end
			it '変更した内容が表示される' do
				expect(page).to have_content 'noda'
				expect(page).to have_content 'yojiro'
				expect(page).to have_content 'ノダ'
				expect(page).to have_content 'ヨウジロウ'
			end
		end
	end
	describe '・配送先一覧画面' do
		before do
			visit delivery_addresses_path
			fill_in 'delivery_address[postal_code]', with: '1250042'
      select '東京', from: 'delivery_address_prefecture_code'
      fill_in 'delivery_address[address_city]', with: '葛飾区'
      fill_in 'delivery_address[address_street]', with: '金町'
      fill_in 'delivery_address[receiver]', with: 'だーつーさん'

      click_button '登録する'
		end
		context '配送先の登録' do
			it '自画面にリダイレクトする' do
				expect(page).to have_content '配送先登録'
			end
			it '登録内容が反映される' do
				expect(page).to have_content '1250042'
			end
		end
		context 'ヘッダーのリンク' do
			it 'topページにリダイレクトする' do
				click_link 'Home-link'
				expect(page).to have_content 'PICK UP'
			end
		end
	end

	describe '・一覧～カートに入れる' do
		before do
			visit products_path

      click_link('product_link1')
		end
		context '商品のリンク' do
			it '商品詳細に遷移する' do
         expect(page).to have_content '消費期限'
			end
			it '商品情報が正しく表示されている' do
				expect(page).to have_content 'ショートケーキ'
			end
		end
		context 'カート' do
		  before do
		  	find_field('cart[number]').set("3")
        click_button 'カートに入れる'
		  end
			it 'カート画面に遷移する' do
        expect(page).to have_content 'ショッピングカート'
      end
      it 'カートに商品が追加されている' do
      	expect(page).to have_content 'ショートケーキ'
      end
      it '注文情報入力画面に遷移' do
      	click_link('info-link')

        expect(page).to have_content '注文情報入力'
      end
		end
	end

	describe '・注文情報入力' do
		before do
			visit delivery_addresses_path
			fill_in 'delivery_address[postal_code]', with: '1250042'
      select '東京', from: 'delivery_address_prefecture_code'
      fill_in 'delivery_address[address_city]', with: '葛飾区'
      fill_in 'delivery_address[address_street]', with: '金町'
      fill_in 'delivery_address[receiver]', with: 'だーつーさん'

      click_button '登録する'

      visit product_path(1)
      find_field('cart[number]').set("2")
      click_button 'カートに入れる'
      click_link('info-link')

      expect(page).to have_content '注文情報入力'
		end
		context '注文情報入力' do
			it '登録した配送先が選択できる' do
         expect(page).to have_content '東京都葛飾区金町'
			end
			it 'サンクスページへ遷移する。' do
        choose('order_payment_銀行振り込み')
        choose('option_2')
        click_button '確認画面に進む'
        click_button '購入を確定する'

        expect(page).to have_content '注文を受け付けました。'
			end
			it 'サンクスページからtopページへ遷移できる。' do
        choose('order_payment_銀行振り込み')
        choose('option_2')
        click_button '確認画面に進む'
        click_button '購入を確定する'

        click_link 'Home-link'
				expect(page).to have_content 'PICK UP'
			end
		end
	end
	describe '・購入後、再度購入' do
		before do

      visit product_path(1)
      find_field('cart[number]').set("2")
      click_button 'カートに入れる'
      click_link('info-link')
      choose('order_payment_銀行振り込み')
      choose('option_1')
      click_button '確認画面に進む'
      click_button '購入を確定する'

      visit products_path

      click_link('product_link1')
      find_field('cart[number]').set("4")
      click_button 'カートに入れる'
      click_link('info-link')
      choose('order_payment_銀行振り込み')
      choose('option_3')
      fill_in 'delivery_address[postal_code]', with: '1760001'
      select '東京', from: 'delivery_address_prefecture_code'
      fill_in 'delivery_address[address_city]', with: '練馬区'
      fill_in 'delivery_address[address_street]', with: '桜台'
      fill_in 'order[receiver]', with: 'だーつーさん'

      click_button '確認画面に進む'
    end
    context '新規住所入力' do
    	it '新規入力できる' do
    	end
    	it '確認画面に遷移' do
    		expect(page).to have_content '注文情報確認'
    	end
    end
    context '情報確認画面' do
    	it '入力した住所が表示される' do
    		expect(page).to have_content '東京都練馬区桜台'
    	end
    	it '支払い方法が表示される' do
    		expect(page).to have_content '銀行振り込み'
    	end
    	it '合計金額が正しい' do
    		expect(page).to have_content '2960'
    	end
    end
    context '購入を確定' do
    	before do
    		click_button '購入を確定する'
    	end
    	it 'サンクスページに遷移する' do
    		expect(page).to have_content '注文を受け付けました。'
    	end
    	it 'サンクスページからマイページへ遷移' do
    		click_link 'My Page'

    		expect(page).to have_content 'マイページ'
      end
    end
    context '配送先位置覧の表示' do
    	before do
    		click_button '購入を確定する'
    		visit user_path(user)

    		click_link 'delivery_link'
    	end
    	it '配送先一覧に遷移する' do
        expect(page).to have_content '配送先登録'
    	end
    	it '購入時に登録した住所が表示される' do
    		expect(page).to have_content '東京都練馬区桜台'
    	end
    end
  end

  describe '退会のテスト' do
  	before do
  		visit user_path(user)
  		click_link '編集する'
  	end
  	context 'マイページのリンク' do
  		it '会員情報編集画面に遷移する' do
        expect(page).to have_content '登録情報編集'
  		end
  	end
  	context '退会ボタン' do
  		it 'アラートが表示される' do
  			click_link '退会する'
  			expect(page).to have_content '本当に退会しますか？'
  	  end
  	 end
  	context '退会する' do
  		it 'top画面に遷移' do
  			click_link '退会する'

  			click_link '退会する'
  			expect(page).to have_content 'PICK UP'
  	  end
  	end
  end

  describe '退会後のテスト' do
  	before do
  		visit edit_user_path(user)
			fill_in 'user[family_name]', with: 'noda'
      fill_in 'user[first_name]', with: 'yojiro'
      fill_in 'user[family_name_kana]', with: 'ノダ'
      fill_in 'user[first_name_kana]', with: 'ヨウジロウ'
      fill_in 'user[email]', with: Faker::Internet.email
      fill_in 'user[tel]', with: '0000000000'
      fill_in 'user[postal_code]', with: '1250042'
      select '東京', from: 'user_prefecture_code'
      fill_in 'user[address_city]', with: '葛飾区'
      fill_in 'user[address_street]', with: '金町'

      click_button '編集内容を保存する'
  		visit user_path(user)
  		click_link '編集する'
  		click_link '退会する'
  		click_link '退会する'
  	end
  	context 'トップ画面' do
  		it 'ヘッダーが未ログイン状態になっている' do
  			expect(page).to have_content 'Log In'
  		end
  		it 'ログイン画面に遷移できる' do
        click_button 'Log In'
        click_on 'ログイン'

  			expect(page).to have_content '会員の方はこちらからログイン'
     	end
  	end
  	context 'ログイン画面' do
  		it 'ログインできない' do
  			click_button 'Log In'
        click_on 'ログイン'

        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'

        expect(page).to have_content '会員の方はこちらからログイン'
  		end
  	end
  	context 'ログイン(管理者)' do
  	  before do
  		  visit new_admin_session_path
  		  fill_in 'admin[email]', with: admin.email
        fill_in 'admin[password]', with: admin.password
        click_button 'ログイン'
  	  end
  		it 'ログイン後、管理者topに遷移' do
  			expect(page).to have_content '本日の注文件数'
  		end
  	end
  	context 'TOP画面(管理者)' do
  		before do
  		  visit new_admin_session_path
  		  fill_in 'admin[email]', with: admin.email
        fill_in 'admin[password]', with: admin.password
        click_button 'ログイン'
  	  end
  		it '会員一覧画面に遷移できる' do
  			click_link 'user-link'
  			expect(page).to have_content '会員一覧'
  		end
  	end
  	context '会員一覧画面(管理者)' do
  		before do
  			visit new_admin_session_path
  		  fill_in 'admin[email]', with: admin.email
        fill_in 'admin[password]', with: admin.password
        click_button 'ログイン'
  			click_link 'user-link'
  		end
  		it '退会したユーザーが退会済みになっている' do
  			expect(page).to have_content '退会済み'
  		end
  		it '会員情報詳細画面に遷移できる' do
  			click_link 'admin-user-link'
  			expect(page).to have_content '会員詳細'
  		end
  	end
  	context '会員情報編集画面(管理者)' do
  		before do
  			visit new_admin_session_path
  		  fill_in 'admin[email]', with: admin.email
        fill_in 'admin[password]', with: admin.password
        click_button 'ログイン'
  			click_link 'user-link'
  		end
  		it '変更した住所が表示されている' do
  			click_link 'admin-user-link'
  			expect(page).to have_content '東京都葛飾区金町'
  		end
      it 'ログアウト後、ログイン画面が表示される' do
      	click_link 'Log Out'
  			expect(page).to have_content '管理者ログイン'
      end
  	end
  end
end
