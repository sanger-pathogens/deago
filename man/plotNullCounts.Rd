% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qcPlots.R
\name{plotNullCounts}
\alias{plotNullCounts}
\title{Plot Null Counts}
\usage{
plotNullCounts(dds, resultsDir)
}
\arguments{
\item{dds}{DESeqDataSet}

\item{resultsDir}{character: path to timestamped results directory}
}
\description{
Generates a barplot showing the number of genes
  which have no reads mapping to them (null counts)
  images/null_counts_per_sample.png.
}
