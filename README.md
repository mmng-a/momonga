# momonga

macOS用のキーボードレイアウトです。`~/Library/Keyboard Layouts/`などにに`.keylayout`を入れることでシステム環境設定のキーボード設定から選択できるようになります。

現状彷徨いながら開発中ですので`layouts`に大量にレイアウトがありますが、どれが正しく動くのか怪しいので注意してください（おそらく`generated`は確実に動きますが、まだ機能が足りません）。

## generator

`datas.swift`にデータを書いて`swift run`をすれば`.keylayout`が出力されます。自分用なのでDTDの内容全てはカバーしていませんが、最低限使えると思います。
