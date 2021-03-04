# Crama

Crama は塾の生徒と講師が利用するためのプラットフォームサービスです。由来はCram Schoolで、塾を意味する言葉です。  
生徒と講師がそれぞれ異なるアクションをできることが特徴です。  

# URL
http://crama.work/

# 開発環境・使用技術
-  AWS Cloud9
-  Ruby 2.5.3  
-  Ruby on Rails 5.2.4  
-  MySQL 8.0.21 
-  Nginx  
-  Unicorn  
-  git/github
-  AWS  
    -  VPC  
    -  EC2
    -  RDS
    -  Route53

# アクション
-  **生徒講師共通**
    - 登録、ログイン機能 (devise)
    - 登録情報の修正
-  **生徒**
    -  ファイルの閲覧  
※ファイルとは、授業内容に関する報告書を指します。生徒に渡します。  
    -  質問の投稿、回答へのコメント(ajax)
-  **講師**
    -  ファイルの作成、閲覧
    -  授業記録の編集(ファイル作成時に自動的に記録)
    -  質問へのコメント(ajax)

# 利用方法
左上に表示されるCramaはトップページに飛びます。ログイン後は左上にMypageが表示され、マイページへ飛びます。<br>

### ログイン方法
トップページから生徒・講師の**ログイン** or **テストログイン**ができます。<br>
テストデータとして、生徒と講師は5人ずつ作成しました。そちらでログインすることも可能です。<br>
例えば、生徒3でログインする場合、**メールアドレス: student3@example.com, パスワード: pass**、となります。<br>
講師としてログインしたい場合、**student → teacher**に変更してください。パスワードは全員共通で**pass**です。<br>
右上のナビバーからもログインや登録ができます。

### ログイン後
マイページでそれぞれ行うアクションを選択します。<br>
ログイン後は右上のナビバーがActionに代わり、アクションを選択できます。  
**↓ログイン後のマイページ↓**  
[![Mypage:生徒](https://i.gyazo.com/cfb3d3241f6309d1a1df908a41da530a.png)](https://gyazo.com/cfb3d3241f6309d1a1df908a41da530a)  
