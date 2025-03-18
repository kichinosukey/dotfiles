# dotfiles

自分のシェル設定（.zshrc）を管理するためのリポジトリ

## セットアップ

```bash
# リポジトリをクローン
git clone https://github.com/kichinosukey/dotfiles.git ~/dotfiles

# バックアップ作成
mv ~/.zshrc ~/.zshrc.backup

# シンボリックリンク作成
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# 設定の反映
source ~/.zshrc  # 初回はszshエイリアスがまだ使えないため
```

## 主な機能

### エイリアス
- `szsh` - .zshrcの再読み込み
- `grep` - 色付きgrep表示
- `airport` - AirPort管理ツール
- `cppmt` - クリップボードコピースクリプト
- `scvenv` - Python仮想環境有効化
- `mkvenv` - Python仮想環境作成
- `yt` - YouTube動画ダウンロード
- `ytwav` - YouTube音声抽出(wav形式)
- `coffee` - coffeeスクリプト実行
- `convert-hf` - Hugging Faceモデル変換

### 関数
- `optimize_image()` - 画像最適化
- `lsd()` - カスタムディレクトリリスト表示

### 外部ツール設定
- [Pyenv](https://github.com/pyenv/pyenv)
- [Direnv](https://github.com/direnv/direnv)
- [Jump](https://github.com/gsamokovarov/jump)
- [Jenv](https://github.com/jenv/jenv)
- [Conda](https://github.com/conda/conda)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs)

## 更新方法

1. .zshrcを編集
2. `szsh` で変更を反映
3. 問題なければcommit