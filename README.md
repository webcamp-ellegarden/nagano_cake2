## ![logo](https://user-images.githubusercontent.com/63890284/83961915-ea8e1500-a8d2-11ea-8c58-ceac9a171885.jpg)ながのCAKE(DMMWEBCAMPチーム開発課題)

![FireShot Capture 002 - NaganoCake - localhost](https://user-images.githubusercontent.com/63890284/84114367-3376d280-aa67-11ea-9f2b-9c70657420f7.png)


長野県にある小さなな洋菓子店「ながのCAKE」の商品を通販するためのECサイト  
元々近隣住民が顧客だったが、昨年始めたInstagramが人気となり、全国から注文が来るようになった。  
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。

**通販について**  
-通販については注文に応じて制作する受注生産型です。  
-現在通販での注文料は十分に対応可能な量なため、１日の受注量に制限は設けない。  
-送料は１配送につき全国一律８００円。  
-友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できる。  
-支払い方法はクレジットカード、銀行振り込みから選択できる。  


**ご利用方法**
1. git cloneしてください  
2. $ bundle install  
3. $ rails db:migrate  
4. $ rails db:seed  

**faker**
fakerを導入しているためダミーデータを使ってログインできます。 
 
*管理者アカウント　
email: "hoge@hoge",password: "password" 
/admin/sign_up　管理者ログインページよりログインしてください。 
 
*ユーザーアカウント
email: "foo#{n+1}@hoge,passwprd: "password"

**使用したフォント**  
Noto Sans Jamaneze  

