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


# --- Summary ---
print("----- PATHS INITIALIZED -----")
print(f"Reading Directory: {rdDir}")
print(f"Raw Data Directory: {rawDataDir}")
print(f"Writing Directory: {wrDir}")
