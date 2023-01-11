\ProvidesClass{cheatsheet}[Cheatsheets are not cheating]

\LoadClass[10pt, parskip=half-]{scrartcl}
\KOMAoptions{pagesize, paper=landscape}

\RequirePackage[margin=1cm]{geometry}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=,prefix=@}

\DeclareStringOption[3]{columns}

\newif\if@english@
\newif\if@unbalanced@

\@unbalanced@false

\DeclareVoidOption{english}{
	\@english@true
}

\DeclareVoidOption{german}{
	\@english@false
}

\DeclareVoidOption{unbalanced}{
	\@unbalanced@true
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
\RequirePackage{multicol}
\RequirePackage{float}

\RequirePackage[strict, autostyle]{csquotes}

\RequirePackage[table]{xcolor}
\definecolor{red}{HTML}{a51d2d}

\RequirePackage[framemethod=TikZ]{mdframed}

\RequirePackage[verbatim=true]{lstfiracode}
\RequirePackage{listings}
\lstset{
	tabsize=2,
	breaklines=true,
	postbreak=\mbox{\textcolor{red}{$\hookrightarrow$}\space},
	style=FiraCodeStyle,
	basicstyle=\ttfamily,
	commentstyle=\color{gray}\itshape,
	keywordstyle=\color{red}\bfseries,
	escapeinside={<!}{!>},
}


\RequirePackage{enumitem}
\setlist[description]{midpenalty=-1000, style=nextline, font=\normalfont\bfseries, leftmargin=1em}

\RequirePackage[hidelinks, linktocpage=true]{hyperref}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\AtBeginDocument{
	\pagestyle{empty}
	\if@unbalanced@
		\begin{multicols*}{\@columns}
	\else
		\begin{multicols}{\@columns}
	\fi

}

\AtEndEnvironment{document}{
	\if@unbalanced@
		\end{multicols*}
	\else
		\end{multicols}
	\fi
}

\AtEndPreamble{
	\hypersetup{
		pdfauthor=\@author,
		pdftitle=\@title,
		pdfsubject=\@title
	}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\setlength{\columnsep}{2em}
\setcounter{secnumdepth}{0}

% \addtokomafont{section}{\color{red}}
\setkomafont{title}{\Large\bfseries\scshape}
\setkomafont{author}{\normalsize}
\setmainfont{FiraSans}
\setmonofont{Fira Code}[
	Contextuals=Alternate
]


\RedeclareSectionCommand[afterindent=off, afterskip=1pt, beforeskip=0.5em]{section}
\RedeclareSectionCommand[afterindent=off, afterskip=1pt, beforeskip=1pt]{subsection}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\email}[1]{
	\newcommand{\@email}{#1}
}

\mdfdefinestyle{titlebox}{linecolor=black, linewidth=1px, roundcorner=2pt}

\renewcommand{\maketitle}{
	\begin{mdframed}[style=titlebox]
		\textcolor{red}{\usekomafont{title}\@title\\[0.5\baselineskip]}%
		{\usekomafont{author}\href{mailto:\@email}{\@author}\hfill\break}
		\normalsize\@date
	\end{mdframed}
}

