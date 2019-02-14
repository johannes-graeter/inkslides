#!/bin/bash
start_s ${4:"0"}
stripped_name=${3%%.pdf}_tmp

echo "writing to $stripped_name.pdf"

echo "\documentclass[]{beamer}
%\usepackage{multimedia}
\usepackage{graphicx}
\usepackage[absolute,overlay]{textpos}

\geometry{paperwidth=238.125mm,paperheight=178.594mm, margin=0cm, hmargin=0cm}
\setbeamersize{text margin left=0cm,text margin right=0cm} 

%\usebackgroundtemplate{\includegraphics[width=\paperwidth]{$1}}
\begin{document}
{
  \setbeamertemplate{footline}{}
  \begin{frame}[plain]
    \begin{textblock*}{\paperwidth}(0.0cm,0.0cm)% {block width} (coords)
      \centering
      \href{run:$2?autostart&loop&start=$4}{\includegraphics[width=0.98\paperwidth]{$1}}
      %\movie[autostart, start=30s, duration=10s, showcontrols=true, width=0.7\paperwidth, height=0.7\paperheight]{}{$2}
    \end{textblock*}
  \end{frame}
}

\end{document}" > $stripped_name.tex

pdflatex -output-directory=$(dirname $3) $stripped_name.tex
mv ${3%%.pdf}_tmp.pdf $3

