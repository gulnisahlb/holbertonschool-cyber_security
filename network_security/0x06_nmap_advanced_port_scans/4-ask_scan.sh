#!/bin/bash
sudo nmap -sA -p "$2" --reason --timeout 1000ms "$1"
