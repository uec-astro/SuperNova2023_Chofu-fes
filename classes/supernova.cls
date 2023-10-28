\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classes/supernova}[2023/08/15 supernova]

% (u)pLaTeX非互換パッケージに対して互換させるパッチを読み込む命令
% \RequirePackage{plautopatch}

% クラスファイルの作成の参考ｰ>https://qiita.com/takahashim/items/5fcc68fbc8a3eca42f07
\LoadClass[%
  lualatex , %エンジン
  paper=a4 , %用紙サイズ(a4paperがdefault)
  book , %文書クラス(articleがdefault)
  openany, % 章が奇数ページから始まる指定の無効化
  fontsize=10pt , %フォントサイズ(10ptがdefault)
  jafontsize=10pt, % 日本語フォントサイズを10pt
  gutter=25.6mm, % のどの余白を25.6mm
  head_space=20mm, % 余白(上)を20mm
  foot_space=20mm, % 余白(下)を20mm
  line_length=165mm, %一行の文字数（本文部分の幅）の設定
  %number_of_lines=30, % 行数の指定
  jlreq_warnings , %日本語組版処理の要件に反する設定が行われた場合に警告
  %sidenote_length={4zw}, %sidenoteの脚注幅設定
]{jlreq} %今一番モダンな日本語クラスファイル

% \PassOptionsToPackage{hyphens}{url} % これいるかは怪しい
\usepackage{luatexja} % LuaLaTeXに移行
\usepackage{subfiles} % 大規模な文章を分割して記述して、統合するためのパッケージ
\usepackage{afterpage} % 次のセクションへ図や表が流れていかないように改ページ
\usepackage{fancyhdr} % 柱とノンブルの制御
\usepackage{setspace} % 行間設定用パッケージ
\usepackage{nextpage} % \cleartooddpage, \cleartoevenpageを有効に
\usepackage[1.7]{bxpdfver} % 出力PDFバージョンを1.7に
% \usepackage{microtype}
% \microtypesetup{fontsize=10pt, spacing=true} % フォントサイズとspacingを設定

\usepackage{grffile} %ファイル名にドットやスペースが入っていても許容できるようにする。
\usepackage[dvipsnames]{xcolor} % 色関連
\usepackage{graphicx, colorinfo} % 図関連
\usepackage{tikz} %tikZ環境
\usepackage{float} % 画像や表を指定した場所に表示する[H]が使える
\usepackage{wrapfig} % 図の回り込み表示が可能

\usepackage{luatexja-otf} % LuaLaTeXにおけるOpen Type Fontの有効化
\usepackage{luatexja-ruby} % ルビを振る \ruby{漢字}{ふりがな}

\usepackage[stable]{footmisc} % 脚注表示形式の制御
\usepackage[final]{pdfpages} %pdfを挿入することが可能
\usepackage{pdfoverlay}

\usepackage{tcolorbox} % テキストのコラムボックスを作成したりいろいろ
\tcbuselibrary{raster,skins,breakable}

\usepackage[
  luatex,
  unicode,
  hidelinks,
  colorlinks=true,
  linkcolor=darkgray, 
  citecolor=darkgray,
  urlcolor=Blue, 
  hyperfootnotes=false
  ]{hyperref}
% urlやハイパーリンクを可能にする。colorlinks=true,allcolors=blueでリンク部分が青くなる。
% \urlstyle{same} % URLの表示形式を本文と同じにする
\usepackage{bookmark} % しおりつきPDFを作る
\usepackage[T1]{fontenc} % フォントエンコーディングをT1にする。
\usepackage{lmodern} % Latin Modern フォントを使う

\usepackage[no-math, noto-otf]{luatexja-preset} % フォントの指定
% 和文フォント設定（上から明朝、ゴシック、等幅）
\setmainjfont{Noto Serif CJK JP}[BoldFont=Noto Serif CJK JP Bold]
\setsansjfont{Noto Sans CJK JP}[BoldFont=Noto Sans CJK JP Bold]
% \setmonojfont{Noto Sans Mono CJK JP}[BoldFont=Noto Sans Mono CJK JP Bold]
% % 欧文フォント設定（上からSerif, Sanserif, Monospace）
% \setmainjfont{Noto Serif}[BoldFont=Noto Serif Bold]
% \setsansjfont{Noto Sans}[BoldFont=Noto Sans Bold]
% \setmonojfont{Noto Sans Mono}[BoldFont=Noto Sans Mono Bold]

\usepackage{emoji}
\setemojifont{TwemojiMozilla} % \setemojifont{Noto Color Emoji}[Renderer=HarfBuzz]または\setemojifont{EmojiOneMozilla}
\newjfontfamily{\jMplus}[ % {\jMplus hoge}で指定した箇所(hoge)のみを「M PLUS 2」フォントで出力させる命令
  YokoFeatures={JFM=jlreq},
  TateFeatures={JFM=jlreqv},
]{M PLUS 2}
\newfontfamily{\Mplus}{M PLUS 2}
\newfontfamily{\MplusCode}{M PLUS 1 Code}
% \newjfontfamily{\jCine}[ % {\jCine hoge}で指定した箇所(hoge)のみを「しねきゃぷしょん」フォントで出力させる命令
%   YokoFeatures={JFM=jlreq},
%   TateFeatures={JFM=jlreqv},
% ]{cinecaption}
\usepackage{tabularx} % 表の幅を指定できる
% hyperrefと競合するため、hyperrefより後で宣言する（これでもグレーらしい）
\usepackage{amsmath,amssymb} % 数式関連 (ONにした場合は末尾の\eqrefを\renewcommandに変更)
\usepackage{siunitx} % SI単位系入力のマクロ
\usepackage{mathtools} % amsmathの拡張
\usepackage{latexsym} % 数学用記号拡張
\usepackage{listings} % \lstlistingなどコードの掲載に必要
%listing環境の調整
\lstset{
  basicstyle={\MplusCode},
  identifierstyle={\small},
  commentstyle={\smallitshape},
  keywordstyle={\small\bfseries},
  ndkeywordstyle={\small},
  stringstyle={\small\ttfamily},
  frame={tb},
  breaklines=true,
  columns=[l]{fullflexible},
  numbers=left,
  xrightmargin=0\zw,
  xleftmargin=3\zw,
  numberstyle={\scriptsize},
  stepnumber=1,
  numbersep=1\zw,
  lineskip=-0.5ex
}

\parindent = 1\zw % 段落ごとに1文字分(全角スペース)のインデント
\NewPageStyle{astrobook}{ % 生TeX原稿での柱とノンブルの設定
  yoko,
  odd_running_head=_section,
  even_running_head=_chapter,
  running_head_position=top-fore-edge,
  nombre_position=bottom-fore-edge
}
\pagestyle{astrobook} % 上の設定を適用
\newcommand{\article}[4][-]{ % PDF原稿の読込みマクロの設定
    \markboth{#2}{#3}
    \phantomsection % hyperrefおよびPDFのブックマークに表示させる
    \addcontentsline{toc}{chapter}{#2}% 個々のタイトルなどは目次ではchapter扱い
    \includepdf[pages=#1, noautoscale=true, fitpaper, pagecommand={}]{#4}
}
% \article{題名}{著者}{ファイル名} で使う

%%%   別行見出し(setionとか)の出力設定（jlreq仕様）  %%%
\SaveHeading{chapter}{\restorechapter}
\ModifyHeading{chapter}{
  font={\Large\bfseries\jMplus\Mplus},
  %label_format={\includegraphics[width=2\zw]{small_star2_skyblue.png}\raisebox{0.5\zw}{\hspace{-1.3\zw}\thechapter}},
  format={
    \centering
    {\color[gray]{0}#1}{#2}
  },
  before_space=1.5ex,
  after_space=1.5ex,
}
\SaveHeading{section}{\restoresection} % \sectionの中身を\restoresectionに待避．

\RenewBlockHeading{section}{1}{
font={\fontsize{10pt}{0}\bfseries\jMplus\Mplus},
format={%
  \begin{tikzpicture}
    \useasboundingbox (0,0) rectangle (0,0);
    \fill[black!50] (0,-4pt) rectangle (8pt, 12pt);
    \draw[black!50,line width=1pt] (0,-4pt) -- (\linewidth,-4pt);
  \end{tikzpicture}%
  \hspace{1\zw}#1#2\hspace{1\zw}#3},
after_label_space=1\zw ,
before_space=2.5ex,
after_space=1.5ex,
} % \sectionを新しく定義する．
%\restoresection % \sectionの中身を元に戻す．

\SaveHeading{subsection}{\restoresubsection} % \subsectionの中身を\restoresubsectionに待避．
\RenewBlockHeading{subsection}{1}{
font={\fontsize{10pt}{0}\bfseries\jMplus\Mplus},
format={%
  \begin{tikzpicture}
    \useasboundingbox (0,0) rectangle (0,0);
    \draw[black!50,line width=1pt] (0,-4pt) -- (.5\linewidth,-4pt);
  \end{tikzpicture}%
  #1#2},
after_label_space=1\zw ,
before_space=2.5ex,
after_space=1.5ex,
} % \subsectionを新しく定義する．

\SaveHeading{subsubsection}{\restoresubsubsection} % \subsectionの中身を\restoresubsectionに待避．
\RenewBlockHeading{subsubsection}{1}{
font={\fontsize{10pt}{0}\bfseries\jMplus\Mplus},
format={#1#2},
after_label_space=1\zw ,
before_space=2.5ex,
after_space=1.5ex,
} % \subsubsectionを新しく定義する．
%\restoresubsubsection % \subsubsectionの中身を元に戻す．

\SetBlockHeadingSpaces{ %別行見出しが連続するときの行間の制御
  {_part{lines=3,before_lines=1},_section{lines=2},_subsection{lines=2}}
  [lines=3]{_section,16pt,_subsection,8pt}
}

% 図表番号を参照するときに図\ref{hoge}とかしなくて言いようにするマクロ
\newcommand{\figref}[1]{図\ref{fig:#1}}
\newcommand{\tabref}[1]{表\ref{tab:#1}}
%\newcommand{\eqref}[1]{式(\ref{eq:#1})}
\renewcommand{\eqref}[1]{式(\ref{eq:#1})}
