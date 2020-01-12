# easy RSS

## 参考にしている資料
  - Ruby on Rails, Vue.js で始めるモダン WEB アプリケーション入門
  
    https://qiita.com/tatsurou313/items/4f18c0d4d231e2fb55f4 #Qiita

  - Active Record コールバック
  
    https://railsguides.jp/active_record_callbacks.html
  
  - Rails スクレイピングでデータを取得(getメソッド・searchメソッド編)備忘録
  
    https://qiita.com/bomber0522/items/19591d18bc5d2b1fc97b #Qiita

  - CSSフレームワーク「Bulma」を利用する時の参考URL

    https://blog.nakamu.life/posts/css-bulma-url

  - https://jp.vuejs.org/v2/cookbook/serverless-blog.html

  - https://dev.m6a.jp/entry/2018/11/14/162259

  - https://qiita.com/OgiharaRyo/items/9949e5a2cda5e48060f0#user

  - https://www.hypertextcandy.com/vue-laravel-tutorial-authentication-part-3/

  - https://tech.medpeer.co.jp/entry/2018/02/26/080000

## 仕様
- URLを
  - 投げると
    - タイトル保存

## 説明
1. URLを入力してPOSTする
2. WebスクレイピングでURL先の情報からTitleを抜き出す
3. URLとTitleを保存する
4. 一覧画面にて表示される
5. 一覧画面は日付と時刻が大きく表示され、それらの降順でソートされる

## 後でやる(優先度の高い順)
1. タグ検索
2. ログイン
3. ユーザーごとの投稿の紐付け

## メモ

- https://www.hypertextcandy.com/vue-laravel-tutorial-authentication-part-3/

  ```
  ストアを作成する際に、インポートした auth.js をモジュールとして登録しています。このように、ストアは種類に応じてモジュールとして分けて作成（認証関係のデータのストア、写真データのストア、などのように）することができます。
  ```
