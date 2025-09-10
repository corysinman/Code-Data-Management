# PathInitializer.R
# Initialize paths for reading and writing data

# Load required library for GUI dialogs
if(!require(tcltk)) install.packages("tcltk")
library(tcltk)

# --- Set Path Variables ---
rdDir <- tk_choose.dir(caption = "Choose Reading Directory")
if(is.na(rdDir)) stop("No reading folder selected")

rawDataDir <- tk_choose.dir(default = rdDir, caption = "Choose Raw Data Directory")
if(is.na(rawDataDir)) stop("No raw data folder selected")

wrDir <- tk_choose.dir(default = rdDir, caption = "Choose Writing Directory")
if(is.na(wrDir)) stop("No writing folder selected")

# --- Ask user for toolbox name ---
toolboxName <- readline(prompt = "Enter the name of the toolbox to check: ")

# --- Check if toolbox is installed ---
if(!require(toolboxName, character.only = TRUE)) {
  cat(sprintf("%s toolbox not found\n", toolboxName))
  folderPath <- tk_choose.dir(caption = sprintf("Select the %s toolbox folder", toolboxName))
  if(!is.na(folderPath)) {
    .libPaths(c(folderPath, .libPaths()))
    cat(sprintf("%s toolbox added to .libPaths\n", toolboxName))
  } else {
    cat(sprintf("%s toolbox not added. Please ensure it is accessible.\n", toolboxName))
  }
} else {
  cat(sprintf("%s toolbox is already available\n", toolboxName))
}

# --- Summary ---
cat("----- PATHS INITIALIZED -----\n")
cat(sprintf("Reading Directory: %s\n", rdDir))
cat(sprintf("Raw Data Directory: %s\n", rawDataDir))
cat(sprintf("Writing Directory: %s\n", wrDir))
