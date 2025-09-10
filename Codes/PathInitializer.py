# PathInitializer.py
# Initialize codes running from Github to get required directories
# Saves and loads path info from pathInfo.txt

import os
from pathlib import Path
from tkinter import Tk, filedialog

def choose_dir(initialdir=None, title="Choose Directory"):
    """Open a folder selection dialog and return the chosen directory."""
    root = Tk()
    root.withdraw()  # hide the main tkinter window
    folder = filedialog.askdirectory(initialdir=initialdir, title=title)
    root.destroy()
    if not folder:
        raise RuntimeError(f"No {title.lower()} selected.")
    return os.path.join(folder, '')


config_file = Path.cwd() / "pathInfo.txt"

if config_file.is_file():
    # --- Load from pathInfo.txt ---
    print("Loading paths from pathInfo.txt ...")
    with open(config_file, "r") as f:
        rdDir = f.readline().strip()
        rawDataDir = f.readline().strip()
        wrDir = f.readline().strip()
else:
    # --- Ask User for Paths ---
    rdDir = choose_dir(title="Choose Reading Directory")

    rawDataDir = choose_dir(initialdir=rdDir, title="Choose Raw Data Directory")

    wrDir = choose_dir(initialdir=rdDir, title="Choose Writing Directory")

    # --- Save to pathInfo.txt ---
    with open(config_file, "w") as f:
        f.write(f"{rdDir}\n")
        f.write(f"{rawDataDir}\n")
        f.write(f"{wrDir}\n")
    print("Path information saved to pathInfo.txt")

# --- Summary Output ---
print("----- PATHS INITIALIZED -----")
print("Reading Directory: " + rdDir)
print("Raw Data Directory: " + rawDataDir)
print("Writing Directory: " + wrDir)
print("-----------------------------")


