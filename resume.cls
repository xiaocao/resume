
\LoadClass{article}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}

% Customize the section headers
\RequirePackage{titlesec}
\RequirePackage{ifthen}
\providecommand\fullresume{false}

% Set the margins
\usepackage[margin=0.5in]{geometry}

% We also to use images
\usepackage[]{graphicx}
\graphicspath{{icons/}}
\usepackage{amsmath}

% We also to use hyperlinks to projects.
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=cyan,
    filecolor=magenta,
    urlcolor=blue,
}

% Turn off page numbering
\pagenumbering{gobble}

% Customize the section heading
\titleformat{\section}
	{\Large\scshape\raggedright} % Customize the size fo the section command
	{}{0em} % Provides a prefix to every section
	{} % Insert code before the heading
	[\titlerule] % Inserts a horizontal line after the heading

% Customize the subsection heading
\titleformat{\subsection}
	{\large\scshape\raggedright}
	{}{0em}
	{}

% This provides dates to certain section headers
\newcommand{\datedsection}[2]{%
	\section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
	\subsection[#1]{#1 \hfill #2}%
}

% Provide a command for name and contact information
\newcommand{\name}[1]{
	\centerline{\Huge{#1}}
}
% Special command for positioning the image correctly
\newcommand{\imgraised}[1]{
	\raisebox{-3pt}{\includegraphics{#1}}
}

% Generate the contact details
\newcommand{\contact}[6]{
	\begin{center}
		\imgraised{address} #1
		\\
		\imgraised{email} #2
		{\LARGE\textperiodcentered}
		\imgraised{email} #3
		{\LARGE\textperiodcentered}
		\imgraised{phone} #4
		{\LARGE\textperiodcentered}
		\imgraised{github} \href{#6}{#5}
	\end{center}
}

% Create some special image sections now
\newcommand{\imgsection}[2]{
    \pagebreak[1] % This tells latex that if we need to, break page
	\section{\protect\includegraphics{#1}\hspace{3mm}#2}
}

% Make another special section for skilss
\newcommand{\skillsubsection}[2]{
    \pagebreak[1] % This tells latex that if we need to, break page
	\subsection[#1]{#1: {\normalfont\normalsize#2}}
}

% A sub-section for recent projects
\newcommand{\projectsubsection}[3]{
    \pagebreak[1] % This tells latex that if we need to, break page
	\subsection[#1]{#1
		- ({\normalfont\normalsize\textit{#2}}) -
		{\normalfont\normalsize#3}
	}
}

% A sub-section for project entires that are old.
\newcommand{\projectsubsectionold}[3]{
    \ifthenelse{\equal{\fullresume}{true}}{
        \projectsubsection{#1}{#2}{#3}
    }{}
}

% A sub-section for recent jobs/experience
\newcommand{\jobsubsection}[4]{
    \pagebreak[1] % This tells latex that if we need to, break page
	\subsection[#1]{#1 \hfill #2
		\\ {\normalfont\normalsize\textit{#3}\\#4}
	}
}

% The sub-section for job/experience entries that are old.
\newcommand{\jobsubsectionold}[4]{
    \ifthenelse{\equal{\fullresume}{true}}{
        \jobsubsection{#1}{#2}{#3}{#4}
    }{}
}
