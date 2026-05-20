# latex

WSL + TeX Live 用の最小 LaTeX テンプレートです。

- LaTeX エンジン: `uplatex`
- PDF 生成: `dvipdfmx`
- 参考文献: `upbibtex`
- 出力先: 各 `main.tex` の隣の `.build/`

## WSL 側のセットアップ

Ubuntu / Debian 系 WSL では、まず TeX Live と latexmk を入れます。

```sh
sudo apt update
sudo apt install texlive-lang-japanese texlive-latex-extra latexmk
```

入ったか確認します。

```sh
which latexmk
which uplatex
which dvipdfmx
which upbibtex
```

## VS Code で使う場合

VS Code では以下を使います。

- 拡張機能: Remote - WSL
- 拡張機能: LaTeX Workshop

このフォルダを **Remote - WSL** で開き、`main.tex` を保存するとビルドされます。

## Zed で使う場合

Zed では LaTeX 拡張機能を入れてください。

- Extension: LaTeX

Zed の texlab による on save build は環境によって不安定なため、このテンプレートでは `latexmk -pvc` による監視方式を使います。

Zed で `main.tex` を開いた状態で、Command Palette から以下のタスクを起動してください。

```text
task: spawn
LaTeX: watch and preview
```

このタスクを一度起動すると、以後はファイル保存のたびに自動で再コンパイルされます。PDF は SumatraPDF で開かれ、更新されます。

止めるときはタスクの terminal で `Ctrl+C` してください。

SumatraPDF は以下の Windows 側パスを使う設定にしています。

```text
C:\Users\hrcte\AppData\Local\SumatraPDF\SumatraPDF.exe
```

WSL 側からは次のパスとして呼び出しています。

```text
/mnt/c/Users/hrcte/AppData/Local/SumatraPDF/SumatraPDF.exe
```

## 出力

```text
main.tex
.build/main.pdf
```

深い階層に文書を置く場合も、各ディレクトリに `main.tex` を置けば、その隣の `.build/` に PDF が出ます。

```text
reports/2026/W01/main.tex
reports/2026/W01/.build/main.pdf
```

## main.tex の注意

`main.tex` の先頭には以下を入れてください。

```tex
% !LW recipe = latexmk-uplatex
```

`% !TEX program = uplatex` は書かないでください。LaTeX Workshop が `uplatex` 単体を実行し、PDF まで生成されないことがあります。

## CLI

```sh
latexmk main.tex
```

## 参考文献

プロジェクトごとに `bib/references.bib` を置く場合:

```tex
\bibliographystyle{junsrt}
\bibliography{bib/references}
```
