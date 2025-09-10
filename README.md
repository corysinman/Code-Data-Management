# Standardized format for Code and Data maintenance
Requirements:
- Create a Github account.
- Install Github Desktop ([here](https://desktop.github.com/download/)).
- Take a look at the Github introductory page ([here](https://docs.github.com/en/get-started/start-your-journey/hello-world))
- Create your project folder structure (see the following)

# Project Folder Structure Creator

This repository contains scripts for automatically creating a standardized project folder structure.  
It supports both **Windows** and **macOS/Linux** platforms. 

	\projectName
		%----> Sync this directory with your Github
		\Codes(Github)
					  \Archive
					  \L1_Nameit
					  \L2_Nameit
					  
		\DataFiles
				  \Archive
				  \L1_Name_R1W1
				  \L2_Name_R1W2	
				  
		%----> Sync this directory with your cloud storage
		\Documents projectName				
				  \Archive
				  \Reports(Docs)
				  \Tracking&Summaries
				  
		\ExtraFiles
				   \Archive

## 📂 Project Structure Overview

This folder structure is designed to keep **code, documents, and data organized and clearly separated**, making it easier to manage, collaborate, and maintain over time.

```
<ProjectName>/
├── Codes(Github)/				###### Code Directory ######---> Sync this directory with your Github
│   ├── Archive/               		# Old or deprecated code
│   ├── L1_Nameit/              	# Level 1 code modules
│   └── L2_Nameit/              	# Level 2 code modules
├── DataFiles/					###### Data Directory ######
│   ├── Archive/                	# Old datasets or backups
│   ├── L1_Name_R1W1/           	# Data for Level 1, Run 1, Week 1
│   └── L2_Name_R1W2/           	# Data for Level 2, Run 1, Week 2
├── Documents <ProjectName>/	###### Documents Directory ######
│   ├── Archive/                	# Old or obsolete documents
│   ├── Reports(Docs)/          	# Reports and written outputs
│   └── Trackings&Summaries/    	# Logs, summaries, and progress tracking
└── ExtraFiles/					###### Miscellaneous Supporting Files Directory ######
    └── Archive/                	# Old or obsolete files
```

---

### ✅ Benefits of This Structure

- **Separation of Concerns**  
  Code, data, and documents live in distinct top-level folders. This keeps your Git repository lightweight and avoids accidental inclusion of large or sensitive files.

- **GitHub-Friendly**  
  The `Codes(Github)` folder is designed to be tracked in Git, while `DataFiles` remains separate, preventing repository bloat.

- **Scalable & Organized**  
  Multiple levels (L1, L2) allow you to structure experiments, modules, or development stages without clutter.

- **Easy Archiving**  
  Dedicated `Archive` folders at every level let you store old versions without mixing them with active work.

- **Cross-Platform Compatibility**  
  Works on both Windows and macOS/Linux with provided setup scripts.

- **Clear Collaboration Workflow**  
  Team members know exactly where to put code, where to store raw/processed data, and where to keep documentation.
---

# How to use it

## 🖥 Windows Instructions

1. Download `create_project.bat` to your computer.
2. Double-click the file **or** run it in Command Prompt:
   ```cmd
   create_project.bat
   ```
3. When prompted, type your project name (e.g., `MyProject`) and press **Enter**.
4. The folder structure will be created in the same directory as the script.

---

## 🍏 macOS / Linux Instructions

1. Download `create_project.sh` to your computer.
2. Open **Terminal** and navigate to the folder containing the script:
   ```bash
   cd /path/to/script
   ```
3. Make the script executable:
   ```bash
   chmod +x create_project.sh
   ```
4. Run the script:
   ```bash
   ./create_project.sh
   ```
5. When prompted, type your project name (e.g., `MyProject`) and press **Enter**.
6. The folder structure will be created in the same directory as the script.

---

## ⚠️ Notes
- For project names containing spaces, you can type them normally when prompted (e.g., `New Research Project`).
- The scripts will not overwrite existing files, but will create any missing folders.
- On macOS/Linux, you can move the `.sh` file to `/usr/local/bin` and run it from anywhere.

---

## 📜 License
MIT License. Feel free to modify and use in your own projects.



