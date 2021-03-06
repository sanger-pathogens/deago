% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/readCountData.R
\name{readCountData}
\alias{readCountData}
\title{Read Count Data}
\usage{
readCountData(targets, path, id_column, data_column, skip = 0,
  sep = "\\t")
}
\arguments{
\item{targets}{A \link{data.frame} containing the target information mapping
samples to their count data files and experimental conditions.  See
\code{\link{importTargets}} for more information.}

\item{path}{A \link{character} string giving the directory containing the
file. This may be omitted if the file is in the current working directory.}

\item{id_column}{A \link{character} string giving the name of the column
which contains the gene identifiers, should be identical for all of the
count data files.}

\item{data_column}{A \link{numeric} which is the index of the column in the
files which contains the count data}

\item{skip}{A \link{numeric} which is the number of non-column-header lines
to skip at start of the file}

\item{sep}{A \link{character} which is field separator}
}
\value{
dataframe: containing count data
}
\description{
Generates a count matrix from a list of files containing count
  data.
}
\details{
\code{readCountData} is the main data import function for
  \code{deago}.  Before importing count data, target information should be
  imported using \code{\link{importTargets}} which will map the count data
  files to the experimental conditions applied for each sample.  The targets
  dataframe should contain the following columns:

  \describe{ \item{\strong{filename}}{name of the file containing the count
  data for the sample} \item{\strong{condition}}{experimental treatment or
  condition that was applied} \item{\strong{replicate}}{replicate identifier
  - can be numeric or character} \item{\strong{label}}{unique sample
  identifier comprised of the \code{condition} and \code{replicate}}}

  For more information on the targets file and dataframe see
  \code{\link{importTargets}}.

  When importing from individual files, count data will be imported using the
  \code{filename} and \code{label} columns in the targets dataframe. Each row
  in the targets file represents a sample, each sample in the targets file
  has a file name and a unique label.  The column containing the gene
  identifiers must have the same column name in each of the count data files.
  This column name should be specified using \code{id_column}. The order of
  these gene identifiers should be the same across all of the count data
  files being imported.

  By default, \code{deago} assumes that the count data column is in the final
  column in the file. If this is not the case, a column number must be
  specified using \code{data_column}.  The reason that \code{deago} uses a
  column number instead of a column name is because many of the different
  count data programs use a filename as the header for the count column which
  would differ between files. As a file may have been renamed between
  creation and analysis, it is also simpler to make sure that the counts are
  in the same place in each of the files.

  Once imported, the first column of the \code{deago} count matrix returned
  by \code{readCountData} will contain the gene identifiers. The remaining
  columns will contain the count data for each sample with the column name
  being the unique label associated with that sample in the targets
  dataframe.
}
\examples{

\dontrun{
readCountData(targets, id_column="genes", data_column=2)
}
}
\seealso{
Other import functions: \code{\link{annotateDataset}},
  \code{\link{importAnnotation}},
  \code{\link{importConfig}}, \code{\link{importTargets}},
  \code{\link{validateConfig}},
  \code{\link{validateTargets}}
}
\concept{count data functions}
\concept{import functions}
