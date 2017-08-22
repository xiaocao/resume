
\LoadClass{article}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}

% Customize the section headers
\RequirePackage{titlesec}

% Set the margins
\usepackage[margin=0.5in]{geometry}

% We also want to use svgs
\usepackage[]{svg}
\usepackage{amsmath}

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
\newcommand{\svgraised}[1]{
	\raisebox{-3pt}{\includesvg{#1}}
}

\newcommand{\contact}[5]{
	\begin{center}
		\svgraised{address} #1 
		\\
		\svgraised{email} #2 
		{\LARGE\textperiodcentered} 
		\svgraised{email} #3 
		{\LARGE\textperiodcentered} 
		\svgraised{phone} #4 
		{\LARGE\textperiodcentered} 
		\svgraised{github} #5
	\end{center}
}
