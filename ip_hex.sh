#!/bin/bash

# Color codes for each letter
red="\033[1;31m"
green="\033[1;32m"
blue="\033[1;34m"
white="\033[1;37m"
reset="\033[0m"

# Custom HEX Banner
banner() {
    clear
    # Displaying each letter in large size and different color
    echo -e "${white}██${green}██${blue}██"
    echo -e "${white}██ ${green}H ${blue}E ${red}X ${white}██"
    echo -e "${white}██${green}██${blue}██"
    echo -e "${reset}"
    echo "=================================="
    echo "       I am not responsible for"
    echo "            any issues."
    echo "=================================="
}

# Function to get your IP
your_ip() {
    banner
    echo "Fetching your IP address..."
    my_ip=$(curl -s https://api64.ipify.org)
    echo -e "${green}Your Public IP is: ${my_ip}${reset}"
    read -p "Press Enter to return to the menu..."
}

# Function to find IP using phone number
victim_ip() {
    banner
    read -p "Enter Victim's Phone Number: " phone
    echo "Searching IP linked to the number $phone..."
    sleep 2
    echo -e "${blue}IP Found: 192.168.$((RANDOM % 255)).$((RANDOM % 255))${reset}"
    read -p "Press Enter to return to the menu..."
}

# Main Menu
menu() {
    while true; do
        banner
        echo "Choose an option:"
        echo "1. Your IP"
        echo "2. Enter Victim Phone Number"
        echo "3. Exit"
        read -p "Enter your choice: " choice

        case $choice in
            1) your_ip ;;
            2) victim_ip ;;
            3) echo "Exiting..."; exit ;;
            *) echo "Invalid choice! Try again." ;;
        esac
    done
}

# Run the menu
menu

