# keylayoutを作ろう！　Macのキー配列の作り方

[これ](https://developer.apple.com/library/archive/technotes/tn2056/_index.html)を読め。以上。じゃさすがにひどいのでちゃんと書きます。




まずは標準のkeylayoutを見てみましょう。DTDは[ここ](file://localhost/System/Library/DTDs/KeyboardLayout.dtd)にありますが、正直サンプルを見たほうが早いです。

## 入手方法

## `keyboard`

```plist
<keyboard group="0" id="12940" name="ABC copy" maxout="2">
```

`id`と`name`は文字通りです。`group`と`maxout`はわかりません。`group`を変えると日本語のローマ字レイアウトの設定に出てこない時があったので`0`のままでいいと思います。

## `layouts`, `layout`

```plist
<layouts>
    <layout first="0" last="17" mapSet="16c" modifiers="f4"/>
    <layout first="18" last="18" mapSet="984" modifiers="f4"/>
    <layout first="21" last="23" mapSet="984" modifiers="f4"/>
    ...
    <layout first="206" last="207" mapSet="984" modifiers="f4"/>
</layouts>
```

`first`と`last`もよくわかってませんが、多分キーコードでしょう。`mapSet`と`modifiers`はIDREFです。Ukuleleで新たにレイアウトを作ってみたところ、`16c`は`ANSI`（USキーボード）、`984`は`JIS`（JISキーボード）のことを指していることがわかりました。

## `modifierMap`, `keyMapSelect`, `modifier`

```plist
<modifierMap id="f4" defaultIndex="7">
    <keyMapSelect mapIndex="0">
        <modifier keys="command?"/>
        <modifier keys="anyShift? caps? command"/>
    </keyMapSelect>
    <keyMapSelect mapIndex="1">
        <modifier keys="anyShift caps?"/>
    </keyMapSelect>
    <keyMapSelect mapIndex="2">
        <modifier keys="caps"/>
    </keyMapSelect>
    <keyMapSelect mapIndex="3">
        <modifier keys="anyOption"/>
    </keyMapSelect>
    <keyMapSelect mapIndex="4">
        <modifier keys="anyShift caps? anyOption command?"/>
    </keyMapSelect>
    <keyMapSelect mapIndex="5">
        <modifier keys="caps anyOption"/>
    </keyMapSelect>
    <keyMapSelect mapIndex="6">
        <modifier keys="caps? anyOption command"/>
    </keyMapSelect>
    <keyMapSelect mapIndex="7">
        <modifier keys="anyShift caps? option? command? control"/>
        <modifier keys="shift? caps? anyOption command? control"/>
        <modifier keys="caps? anyOption? command? control"/>
    </keyMapSelect>
</modifierMap>
```

# 日本語入力の罠

あれ？　日本語のキー配置設定しなくていいの？　と思った人もいるかもしれません。確かに`、``。``「``」`とか一切設定してません。でもこのままで大丈夫！　この領域はinput methodのお仕事なので`,`は`、`に、`[`は`「`に勝手に変換してくれます。標準の設定を見てみましょう。[`/System/Library/Input Methods/JapaneseIM.app/Contents/PlugIns/JapaneseIM.appex/Contents/Resources/KeySetting_Default.plist`](file:/System/Library/Input Methods/JapaneseIM.app/Contents/PlugIns/JapaneseIM.appex/Contents/Resources/KeySetting_Default.plist)に対応が書いてあります。

でもこれは嬉しくない。もちろん日本語ではこれらが打てるべきですが、自分で設定したキーマップが潰されてしまいます。`、`とか`〔`だけならinput methodも自作すればいいのですが、実はそれをやっても中途半端な対応になってしまうのです。  
日本語で`/`を打つと（設定によって）`・`か`／`のどちらかが出力されます。僕の場合は`/`で`・`、⌥ + `/`で`／`が打てます。そして`・`は[さっきのリスト](file:/System/Library/Input Methods/JapaneseIM.app/Contents/PlugIns/JapaneseIM.appex/Contents/Resources/KeySetting_Default.plist)で検索してもヒットしません。設定されてるのは[さっきと同じディレクトリの`Defaults.plist`](file:/System/Library/Input Methods/JapaneseIM.app/Contents/PlugIns/JapaneseIM.appex/Contents/Resources/Defaults.plist)。（これはデフォルトのですが、中の構造を知るには十分です。）

/Users/masashiaso/Library/Preferences/com.apple.inputmethod.Kotoeri.plist

```plist
<key>JIMPrefCharacterForSlashKey</key>
<integer>1</integer>
```

うーん、数値指定です。これ以上は厳しそう……。`JIMPrefCharacterForSlashKey `でgrepしたりもしたんですがヒットしないですし、input methodを一から作らない限りここらへんに介入するのは無理そうです。

詰まるところ日本語IMの設定を