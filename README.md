# SUGI2026

SAS Users Group Conference 2026

## 発表: SASとRを併用する統計プログラミング業務におけるレポーティング効率化


### ファイル構成（最小限）

| ファイル | 役割 |
|---|---|
| `slides.qmd` | 発表スライド本体（revealjs, knitr エンジン） |
| `.gitignore` | レンダリング生成物・SAS ログ・認証情報を除外 |
| `README.md` | 環境と手順 |

### 構成
-背景
-本発表で扱う3つの方法
-Quarto単体のSASコードブロック
-SASmarkdownとは
-SASmarkdownの実行
-sasquatchとは
-sasquatchの実行
-まとめ
-References

### 前提環境

- [Quarto](https://quarto.org) CLI
- R（`knitr`, `rmarkdown`）
- SAS 実行環境:
  - **ローカルに SAS が無い場合** → **sasquatch + SAS OnDemand for Academics (ODA, 無料)** を利用
  - Quarto 単体 `{sas}` ブロック / SASmarkdown はローカル SAS が必須（本ドラフトでは表示のみ）

### sasquatch（ローカル SAS 不要）のセットアップ

```r
install.packages("sasquatch")
library(sasquatch)
sasquatch::install_saspy()                     # SASPy を仮想環境に導入
sasquatch::configure_saspy(template = "oda")   # ODA 接続設定
```

ODA アカウント: <https://welcome.oda.sas.com/>


### 参考

- SASmarkdown: <https://github.com/Hemken/SASmarkdown>
- sasquatch: <https://docs.ropensci.org/sasquatch/>
