\ProvidesClass{arbeit}[This class makes writing articles fun again]

\LoadClass[11pt, DIV=12, footinclude=off, headinclude=on, BCOR=0pt, oneside]{scrartcl}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=,prefix=@}

\newif\if@english@

\DeclareVoidOption{english}{
	\@english@true
}

\DeclareVoidOption{german}{
	\@english@false
}

\ProcessKeyvalOptions*

\if@english@
	\RequirePackage[english]{babel}
\else
	\RequirePackage[ngerman]{babel}
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{fontspec}
\RequirePackage{microtype}
\RequirePackage{etoolbox}
\RequirePackage{setspace}

\RequirePackage[strict, autostyle]{csquotes}

\RequirePackage[
	backend=biber,
	style=alphabetic,
	sorting=ynt
]{biblatex}

\RequirePackage[automark]{scrlayer-scrpage}

\RequirePackage[table]{xcolor}

\RequirePackage{wrapfig}
\RequirePackage{float}

\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows, arrows.meta, shapes, automata, positioning, positioning, fit, calc, fadings, overlay-beamer-styles}
\tikzstyle{inline} = [shape=rectangle,inner sep=0pt,text depth=0pt]
\tikzstyle{squarenode} = [rectangle, draw=black, line width=0.6pt]
\tikzstyle{roundednode} = [squarenode, rounded corners=1mm]
\tikzstyle{roundnode} = [squarenode, circle]
\tikzstyle{arrow} = [thick,->,>=stealth]
\tikzstyle{textarrow} = [awesomegray,shorten >=1mm,shorten <=1mm,thick,->,-{Kite[open]}]
\tikzset{
	node distance = 5mm,
}

\RequirePackage{enumitem}
\setlist[enumerate]{itemsep=-0.5\parskip}
\setlist[itemize]{itemsep=-0.5\parskip}
\setlist[description]{style=nextline, font=\normalfont}

\RequirePackage{listings}
\lstset{
	mathescape,
	frame=tb,
	captionpos=b,
	basicstyle=\footnotesize\ttfamily,
	backgroundcolor=\color{white},
	keywordstyle=\bfseries\ttfamily\color{blue!50},
	stringstyle=\color{orange!50!black}\ttfamily,
	commentstyle=\color{gray}\ttfamily,
	showstringspaces=false,
	flexiblecolumns=false,
	tabsize=2,
	numbers=left,
	numberstyle=\footnotesize,
	numberblanklines=true,
	stepnumber=1,
	float=H,
	numbersep=10pt,
	xleftmargin=15pt,
	breaklines=true,
	postbreak=\mbox{\textcolor{gray}{$\hookrightarrow$}\space},
	escapeinside={<@}{@>},
	literate=%
	{Ã–}{{\"O}}1
	{Ã„}{{\"A}}1
	{Ãœ}{{\"U}}1
	{ÃŸ}{{\ss}}1
	{Ã¼}{{\"u}}1
	{Ã¤}{{\"a}}1
	{Ã¶}{{\"o}}1
	{~}{{\textasciitilde}}1
}

\RequirePackage[hidelinks, linktocpage=true]{hyperref}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\uni}[1]{
	\newcommand{\@uni}{#1}
}

\newcommand{\matrnr}[1]{
	\newcommand{\@matrnr}{#1}
}

\newcommand{\type}[1]{
	\newcommand{\@type}{#1}
}

\newcommand{\course}[1]{
	\newcommand{\@course}{#1}
}

\newcommand{\supervisorone}[1]{
	\newcommand{\@supervisorone}{#1}
}

\newcommand{\supervisortwo}[1]{
	\newcommand{\@supervisortwo}{#1}
}

\newcommand{\logo}[1]{
	\newcommand{\@logo}{#1}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\setmainfont{Latin Modern Roman}
\setsansfont{Latin Modern Sans}
\setmonofont{Inconsolata}
\setkomafont{pagehead}{\rmfamily\upshape}
\setkomafont{pagefoot}{\rmfamily\upshape}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\setparsizes{1em}{\baselineskip}{\parfillskip}
\linespread{1.1}
\setlength{\headsep}{3em}
\setlength{\skip\footins}{\baselineskip}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\KOMAoptions{headsepline=true}
\KOMAoptions{footsepline=false}
\ihead{}
\chead{}
\ohead{\headmark}
\ifoot{}
\cfoot{\thepage}
\ofoot{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand*{\fullref}[1]{\hyperref[{#1}]{\autoref*{#1} - \nameref*{#1}}}
\newcommand*{\equref}[1]{\hyperref[{#1}]{\autoref*{#1}}}
\newcommand{\emptypage}{%
	\newpage%
	\thispagestyle{empty}%
	\mbox{}%
	\newpage%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\renewcommand{\maketitle}{
	\begin{titlepage}
		\centering%
		\includegraphics[scale=0.3]{\@logo}%
		\vspace{20mm}%
		\hrule%
		\begin{spacing}{2}%
		{\Huge\bfseries\@title}%
		\end{spacing}%
		\vspace{0.5\baselineskip}%
		\hrule%
		\vspace{10mm}%
		{\Large\@type}%
		\vspace{25mm}\break%
		\begin{minipage}[t]{0.4\textwidth}%
			\begin{flushleft}%
				\large\emph{Autor:}\break%
				\@author~(\@matrnr)%
			\end{flushleft}%
		\end{minipage}%
		\begin{minipage}[t]{0.4\textwidth}%
			\begin{flushright}\large%
				\emph{Erstgutachter:}\break%
				\@supervisorone\break%
				\emph{Zweitgutachter:}\break%
				\@supervisortwo%
			\end{flushright}%
		\end{minipage}\break%
		\vfill%
		\@date%
		\vfill%
		\@uni\break%
		Studiengang \@course%
	\end{titlepage}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\AtEndPreamble{
	\recalctypearea
	\hypersetup{
		pdfauthor=\@author,
		pdftitle=\@title,
		pdfsubject=\@title
	}
}