#!/bin/bash

# Prompt for project name
read -p "Enter Project Name: " id

# Create directories
mkdir -p "$id/Codes(Github)/Archive"
mkdir -p "$id/Codes(Github)/L1_Nameit"
mkdir -p "$id/Codes(Github)/L2_Nameit"

mkdir -p "$id/DataFiles/Archive"
mkdir -p "$id/DataFiles/L1_Name_R1W1"
mkdir -p "$id/DataFiles/L2_Name_R1W2"

mkdir -p "$id/Documents $id/Archive"
mkdir -p "$id/Documents $id/Reports(Docs)"
mkdir -p "$id/Documents $id/Trackings&Summaries"

mkdir -p "$id/ExtraFiles/Archive"

echo "Directory structure created for Project: $id"