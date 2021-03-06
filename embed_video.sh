#!/bin/bash
stripped_name=${3%%.pdf}_tmp

echo "writing to $stripped_name.pdf"

echo "\documentclass[]{beamer}
\usepackage{multimedia}
\usepackage{graphicx}
\usepackage[absolute,overlay]{textpos}

%\geometry{margin=0cm, hmargin=0cm}
\geometry{paperwidth=238.125mm,paperheight=178.594mm, margin=0cm, hmargin=0cm}
\setbeamersize{text margin left=0cm,text margin right=0cm} 

\usebackgroundtemplate{\includegraphics[width=\paperwidth]{$1}}
\begin{document}
{
  \setbeamertemplate{footline}{}
  \begin{frame}[plain]
    \begin{textblock*}{0.99\paperwidth}(0.01\paperwidth,0.2\paperheight)% {block width} (coords)
      \centering
      \movie[autostart, start=30s, duration=10s, showcontrols=true, width=0.7\paperwidth, height=0.7\paperheight]{}{$2}
    \end{textblock*}
  \end{frame}
}

\end{document}" > $stripped_name.tex

pdflatex -output-directory=$(dirname $3) $stripped_name.tex
mv ${3%%.pdf}_tmp.pdf $3

