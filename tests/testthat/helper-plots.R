functionList <- list( 'plotReadCounts' = 'plotReadCounts',
                      'plotNullCounts' = 'plotNullCounts',
                      'plotSampleDistances' = 'plotSampleDistances',
                      'pcaPlot' = 'pcaPlot',
                      'pcaScreePlot' = 'pcaScreePlot',
                      'plotCooks' = 'plotCooks',
                      'plotDensity' = 'plotDensity',
                      'plotDispersionEstimates' = 'plotDispersionEstimates')

testPlot <- function(functionName, expectedDDS, expectedPlot, fileName, resultsDirectory, suppressPlotMessages=FALSE)
{
  stopifnot(functionName %in% functionList)
  test_function <- get(functionList[[functionName]])

  if (suppressPlotMessages) {
    expect_silent(observed_plot <- suppressMessages(test_function(expectedDDS, resultsDirectory)))
  } else {
    expect_silent(observed_plot <- test_function(expectedDDS, resultsDirectory))
  }
  expect_is(observed_plot, 'ggplot')

  observed_file <- file.path(resultsDirectory, 'images', fileName)
  expect_true(file.exists(observed_file))

  expect_equal(ggplot2::layer_data(observed_plot), ggplot2::layer_data(expectedPlot))
  expect_equal(ggplot2::layer_scales(observed_plot), ggplot2::layer_scales(expectedPlot))
  expect_identical(observed_plot$theme, expectedPlot$theme)
}
