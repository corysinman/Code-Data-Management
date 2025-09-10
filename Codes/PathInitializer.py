import os
from tkinter import filedialog, Tk

# Hide the root Tk window
root = Tk()
root.withdraw()

# --- Set Path Variables ---
rdDir = filedialog.askdirectory(title="Choose Reading Directory")
if not rdDir:
    raise Exception("No reading folder selected")

rawDataDir = filedialog.askdirectory(initialdir=rdDir, title="Choose Raw Data Directory")
if not rawDataDir:
    raise Exception("No raw data folder selected")

wrDir = filedialog.askdirectory(initialdir=rdDir, title="Choose Writing Directory")
if not wrDir:
    raise Exception("No writing folder selected")

# --- Ask user for toolbox name ---
toolboxName = input("Enter the name of the toolbox to check: ")

# --- Check if toolbox is importable ---
try:
    __import__(toolboxName)
    print(f"{toolboxName} toolbox is already available")
except ImportError:
    print(f"{toolboxName} toolbox not found")
    folderPath = filedialog.askdirectory(title=f"Select the {toolboxName} toolbox folder")
    if folderPath:
        import sys
        sys.path.append(folderPath)
        print(f"{toolboxName} toolbox added to sys.path")
    else:
        print(f"{toolboxName} toolbox not added. Please ensure it is accessible.")

# --- Summary ---
print("----- PATHS INITIALIZED -----")
print(f"Reading Directory: {rdDir}")
print(f"Raw Data Directory: {rawDataDir}")
print(f"Writing Directory: {wrDir}")
