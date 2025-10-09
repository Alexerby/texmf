\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{personal_letter}[2025/09/16 Personligt brev]

\LoadClass[a4paper,11pt]{letter}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[swedish]{babel}
\RequirePackage{geometry}
\geometry{top=2.5cm,bottom=2.5cm,left=2.5cm,right=2.5cm}

\newcommand{\recipientname}{}
\newcommand{\recipientaddress}{}
\newcommand{\letterdate}{\today}

\renewcommand{\date}[1]{\def\letterdate{#1}} % Om användaren sätter ett datum


\makeatletter
\renewcommand{\closing}[1]{%
  \par\nobreak\vspace{2\parskip}%
  {\raggedright #1\par}\nobreak\vspace{1.5\parskip}%
}
\makeatother
