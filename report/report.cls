\ProvidesClass{report}[This class makes writing a thesis fun again]

\LoadClass[
	11pt,
	DIV=11,
	footinclude=off,
	headinclude=on,
	BCOR=0pt,
	oneside,
	abstract=on,
	toc=listofnumbered,
	toc=bibnumbered,
	toc=indented,
	heading=normal,
	twocolumn
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

\DeclareBoolOption{wideabstract}
\DeclareBoolOption{awesomeminted}

\ProcessKeyvalOptions*

\if@english@
	\RequirePackage[english]{babel}
\else
	\RequirePackage[ngerman]{babel}
\fi

\addto\captionsngerman{\renewcommand{\abstractname}{Abstract}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{colors}
\RequirePackage{fontspec}
\RequirePackage{microtype}
\RequirePackage{etoolbox}
\RequirePackage{setspace}
\RequirePackage{lastpage}
\RequirePackage{unicode-math}
\RequirePackage{cuted}

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

\RequirePackage[inline]{enumitem}
\setlist[enumerate]{itemsep=-0.5\parskip}
\setlist[itemize]{itemsep=-0.5\parskip}
\setlist[description]{style=nextline, font=\normalfont}

\usepackage[newfloat=true,cache=false]{minted}
\setminted{
	numbers=left,
	autogobble=true,
	breaklines=true,
	breakbytoken=true,
	breakbytokenanywhere=true,
	breaksymbolleft=\tiny\ensuremath{\textcolor{gray}{\hookrightarrow}},
	frame=lines,
	samepage=true,
	tabsize=2,
	baselinestretch=1.2,
	fontsize=\small,
	numbersep=6pt,
	xleftmargin=10pt,
	highlightcolor=lightgray!50
}
\if@awesomeminted\usemintedstyle{awesome}\else\usemintedstyle{tango}\fi

\RequirePackage{nowidow}
\setnowidow[5]
\setnoclub[4]

\RequirePackage[nospace]{varioref}
\RequirePackage[hidelinks, linktocpage=true]{hyperref}
\RequirePackage{cleveref}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\email}[1]{
	\newcommand{\@email}{#1}
}

\newcommand{\uni}[1]{
	\newcommand{\@uni}{#1}
}

\newcommand{\institute}[1]{
	\newcommand{\@institute}{#1}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\setmainfont{Latin Modern Roman}
\setsansfont{Latin Modern Sans}
\setmonofont{Inconsolata}
\setmathfont{Latin Modern Math}
\setkomafont{pagehead}{\rmfamily\upshape}
\setkomafont{pagefoot}{\rmfamily\upshape}
\setkomafont{title}{\Huge\bfseries\sffamily}
\setkomafont{author}{\large}
\newkomafont{uni}{\large}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\setparsizes{1em}{0pt}{\parfillskip}
\setlength{\columnsep}{1.5em}
\setlength{\skip\footins}{\baselineskip}
\setcounter{tocdepth}{\subsectiontocdepth}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\KOMAoptions{headsepline=false}
\KOMAoptions{footsepline=false}
\ihead{}
\chead{\emph{\@title}}
\ohead{}
\ifoot{}
\cfoot[\thepage~/~\pageref{LastPage}]{\thepage~/~\pageref{LastPage}}
\ofoot{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\renewcommand\fullref[1]{\hyperref[{#1}]{\autoref*{#1}~- \nameref*{#1}~\vpageref{#1}}}
\newcommand\equref[1]{\hyperref[{#1}]{\autoref*{#1}}}
\newcommand\note[1]{\footnote{#1}}
\newcommand\cpp{C\nolinebreak\kern-0.17em\raise0.20ex\hbox{+\kern-0.05em+}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\renewcommand{\maketitle}{
	\thispagestyle{plain}%
	\begin{strip}%
		\raggedright%
		\textcolor{black}{\hrule}%
		\vspace{2em}%
		{\usekomafont{title}\@title}\medskip\par%
		\vspace{1em}%
		{\usekomafont{author}\href{mailto:\@email}{\@author}}\vskip-.1\baselineskip\par%
		{\usekomafont{uni}\@uni~--~\@institute}\par%
		\vspace{1em}%
		\textcolor{black}{\hrule}%
		\vspace{1.5em}%
		\begin{center}%
		\@date%
		\end{center}%
		\if@wideabstract\else\vspace{3em}\fi
	\end{strip}%
}

\let\oldabstract\abstract
\let\oldendabstract\endabstract
\renewenvironment{abstract}{
	\if@wideabstract%
		\addtokomafont{section}{\centering}%
		\begin{strip}%
		\vspace{-2em}%
		\begin{addmargin}[3em]{3em}%
	\fi%
	\oldabstract%
}{
	\if@wideabstract%
		\end{addmargin}%
		\vspace{3em}%
		\end{strip}%
	\fi%
	\oldendabstract%
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
	\raggedbottom
}

\AtBeginDocument{
	\newcommand\reftext{(\if@english@ P\else S\fi.~\thevpagerefnum)}
	\renewcommand\reftextbefore{\reftext}
	\renewcommand\reftextfacebefore{\reftext}
	\renewcommand\reftextafter{\reftext}
	\renewcommand\reftextfaceafter{\reftext}
	\renewcommand\reftextfaraway[1]{\reftext}
	\renewcommand\reftextcurrent{}
}

\preto\listing{\appto\endminted\unskip}

\preto\tableofcontents{\microtypesetup{protrusion=false}}
\appto\tableofcontents{\microtypesetup{protrusion=true}}