% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/contrastPlots.R
\name{plotVolcano}
\alias{plotVolcano}
\title{Volcano plot}
\usage{
plotVolcano(contrast, resultsDir, alpha = 0.05, lfc = 2,
  geneSymbols = NULL, geneLabels = FALSE)
}
\arguments{
\item{contrast}{DESeq2 contrast}

\item{resultsDir}{Name of timestamped results directory}

\item{alpha}{FDR}

\item{lfc}{log2FoldChange}

\item{geneSymbols}{gene symbols}

\item{geneLabels}{description}
}
\description{
Generates volcano plot for each contrast
}
