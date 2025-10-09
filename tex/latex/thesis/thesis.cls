\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2025/05/23 Flexible thesis class]

%------------------------------------------------------
% Base class and font size
%------------------------------------------------------
\LoadClass[12pt]{report}  % Use report class with 12pt font size by default

%------------------------------------------------------
% Load essential packages
%------------------------------------------------------
% Geometry for page layout
\RequirePackage{geometry}
% Set line spacing to 1.5
\RequirePackage{setspace}
% Graphics inclusion
\RequirePackage{graphicx}

%------------------------------------------------------
% University-specific options
%------------------------------------------------------
\newif\if@su
\newif\if@lund

\DeclareOption{su}{\@sutrue}
\DeclareOption{lund}{\@lundtrue}
\ProcessOptions\relax

%------------------------------------------------------
% Apply layout and spacing defaults
%------------------------------------------------------
\onehalfspacing
\geometry{margin=1in}

%------------------------------------------------------
% Load university-specific style packages if requested
%------------------------------------------------------
\if@su
  \RequirePackage{su}      % University of Stuttgart style package (example)
\fi

\if@lund
  \RequirePackage{lund}    % Lund University style package (example)
\fi

%------------------------------------------------------
% Helper macro: create setter commands and storage macros
%------------------------------------------------------
\newcommand{\newsetter}[1]{%
  % Create a storage macro initially empty: \<name>value
  \expandafter\newcommand\csname #1value\endcsname{}%
  % Create a setter command: \<name>{...} stores value internally
  \expandafter\newcommand\csname #1\endcsname[1]{%
    \expandafter\renewcommand\csname #1value\endcsname{##1}%
  }%
}

%------------------------------------------------------
% Create setter/storage pairs for metadata
%------------------------------------------------------
\newsetter{supervisor}
\newsetter{coursecode}
\newsetter{coursename}
\newsetter{ects}
\newsetter{seminardate}
\newsetter{department}

%------------------------------------------------------
% University logo command: set by option
%------------------------------------------------------
\newcommand{\universitylogo}{}

\if@su
  \renewcommand{\universitylogo}{logos/su-logo.jpg}
\fi

\if@lund
  \renewcommand{\universitylogo}{logos/lund-logo.png}
\fi

%------------------------------------------------------
% Custom title page command (can be overridden)
%------------------------------------------------------
\newcommand{\makethesistitle}{
  \begin{titlepage}
    % University logo top-left
    \makebox[0pt][l]{%
      \raisebox{-1cm}{\includegraphics[width=0.25\textwidth]{\universitylogo}}%
    }
    \vspace*{3cm} % vertical space below logo

    % Center title and author information
    \centering
    {\Huge \bfseries \@title \par}
    \vspace{1cm}
    {\Large \@author \par}
    \vspace{0.5cm}
    {\normalsize \departmentvalue \par}
    \vfill

    % Bottom-left additional info
    \begin{flushleft}
      Supervisor: \supervisorvalue \par
      \coursecodevalue{} -- \coursenamevalue{} (\ectsvalue{} ECTS) \par
      Seminar date: \seminardatevalue \par
    \end{flushleft}
  \end{titlepage}
}

%------------------------------------------------------
% Math packages: enhanced math support
%------------------------------------------------------
\RequirePackage{amsmath}    % AMS math features
\RequirePackage{amssymb}    % Additional math symbols
\RequirePackage{amsthm}     % Theorem environments
\RequirePackage{mathtools}  % Extensions and fixes for amsmath

%------------------------------------------------------
% Bibliography support using biblatex with biber backend
%------------------------------------------------------
\RequirePackage[
  backend=biber,
  style=authoryear,   % Default bibliography style
  sorting=nyt      % Sort by name, year, title
]{biblatex}



%------------------------------------------------------
% Hyperlinks
%------------------------------------------------------
\RequirePackage[
  colorlinks=true,
  linkcolor=blue,      % links to sections, figures, tables, etc.
  citecolor=blue,      % citation links
  urlcolor=blue        % URLs
]{hyperref}

%------------------------------------------------------
% End of class file
%------------------------------------------------------
