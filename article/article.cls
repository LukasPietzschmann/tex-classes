\ProvidesClass{arbeit}[This class makes writing articles fun again]

\LoadClass[
	11pt,
	DIV=10,
	footinclude=off,
	headinclude=on,
	BCOR=0pt,
	oneside,
	abstract=on,
	toc=listofnumbered,
	toc=bibnumbered,
	toc=indented,
]{scrartcl}

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

\addto\captionsngerman{\renewcommand{\abstractname}{Abstract}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{fontspec}
\RequirePackage{microtype}
\RequirePackage{etoolbox}
\RequirePackage{setspace}
\RequirePackage{lastpage}

\RequirePackage[
	format=plain,
	indention=1em,
	labelformat=parens,
	labelsep=endash
]{caption}
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

\usepackage[newfloat=true]{minted}
\setminted{
	numbers=left,
	autogobble=true,
	breaklines=true,
	breakbytoken=true,
	breakbytokenanywhere=true,
	breaksymbolleft=\tiny\ensuremath{\textcolor{gray}{\hookrightarrow}},
	escapeinside=@@,
	frame=lines,
	samepage=true,
	tabsize=2,
	baselinestretch=1.2,
	fontsize=\small,
	numbersep=8pt,
}

\RequirePackage{nowidow}
\setnowidow[5]
\setnoclub[4]
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
\setcounter{tocdepth}{\subsectiontocdepth}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\KOMAoptions{headsepline=true}
\KOMAoptions{footsepline=false}
\ihead{}
\chead{}
\ohead{\headmark}
\ifoot{}
\cfoot{\thepage~/~\pageref{LastPage}}
\ofoot{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand\fullref[1]{\hyperref[{#1}]{\autoref*{#1}~-~\nameref*{#1}}}
\newcommand\equref[1]{\hyperref[{#1}]{\autoref*{#1}}}
\newcommand\emptypage{\clearpage\thispagestyle{empty}\mbox{}\clearpage}
\newcommand\sidenote[1]{\unskip~\marginpar{\hspace{0pt}\raggedright\small\itshape #1}($\rightarrow$)}
\newcommand\dash{\unskip\nobreak\thinspace\textendash\thinspace\ignorespaces}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\let\oldtoc\tableofcontents
\renewcommand{\tableofcontents}{%
	\clearpage%
	\thispagestyle{plain}\setcounter{page}{1}\pagenumbering{roman}%
	\oldtoc%
	\clearpage%
	\setcounter{page}{1}\pagenumbering{arabic}
}

\renewcommand{\maketitle}{
	\begin{titlepage}
		\centering%
		\includegraphics[width=\textwidth, height=2.5cm, keepaspectratio]{\@logo}%
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
				\emph{\if@english@ Examiner\else  Erstgutachter\fi:}\break%
				\@supervisorone\break%
				\emph{\if@english@ Second Examiner\else  Zweitgutachter\fi:}\break%
				\@supervisortwo%
			\end{flushright}%
		\end{minipage}\break%
		\vfill%
		\@date%
		\vfill%
		\@uni\break%
		\if@english@ Course\else Studiengang\fi~\@course%
	\end{titlepage}
	\clearpage%
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

\AtBeginEnvironment{abstract}{\clearpage\thispagestyle{empty}}
\AtEndEnvironment{abstract}{\clearpage}

\AfterEndEnvironment{figure}{\noindent}

\preto\section\clearpage

\preto\printbibliography\clearpage
\appto\printbibliography\clearpage

\preto\listing{\appto\endminted\unskip}