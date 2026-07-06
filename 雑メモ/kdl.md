layout {
    // 画面上部のタブバー
    pane size=1 borderless=true {
        plugin location="zellij:tab-bar"
    }

    // メインの作業領域（左右分割）
    pane split_direction="vertical" {

        // 【左側】メイン画面（全体の80%の幅を確保）
        // focus=true にしておくことで、起動時に最初からここに入力できる状態になります
        pane size="50%" name="[Main]" focus=true

        // 【右側】サブ画面のスタック（全体の20%の幅の中に、縦割ちで3つ並べる）
        pane size="50%" split_direction="horizontal" {
            pane name="(A)" command="ping" {
                args "127.0.0.1"
            }
            pane name="(B)"
            pane name="(C)"
            pane name="(D)"
            pane name="(E)"
        }
    }

    // 画面下部のステータスバー（操作ガイド）
    pane size=2 borderless=true {
        plugin location="zellij:status-bar"
    }
}
