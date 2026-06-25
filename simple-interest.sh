#!/bin/bash

# Simple Interest Calculator in Bash

echo "--------------------------------------------------"
echo "            Simple Interest Calculator            "
echo "--------------------------------------------------"

# Prompt user for the principal amount
read -p "Enter the Principal amount (P): " principal

# Prompt user for the annual interest rate (as a percentage, e.g., 5 for 5%)
read -p "Enter the Annual Interest Rate in % (R): " rate

# Prompt user for the time period in years
read -p "Enter the Time Period in years (T): " time

# Validate that inputs are numbers and not empty
if [[ -z "$principal" || -z "$rate" || -z "$time" ]]; then
    echo "Error: All inputs are required and must be numeric."
    exit 1
fi

# Calculate simple interest using 'bc' for floating-point math support
# Formula: SI = (P * R * T) / 100
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc -l)

# Calculate total final amount
# Formula: Total = P + SI
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc -l)

echo "--------------------------------------------------"
echo "Results:"
echo "--> Simple Interest Earned: \$$simple_interest"
echo "--> Total Final Balance:    \$$total_amount"
echo "--------------------------------------------------"
