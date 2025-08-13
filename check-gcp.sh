#!/bin/bash



current_project=$(gcloud config get-value project 2>/dev/null)

# Check if project is set
if [[ "$current_project" == "(unset)" || -z "$current_project" ]]; then
    echo "⚠️ No Google Cloud project is currently set."
    exit 1
fi

if [[ "$current_project" != "$MY_GPROJECT" ]]; then
    echo "⚠️ Project mismatch!"
    echo "   Expected: $MY_GPROJECT"
    echo "   Found:    $current_project"
    exit 1
fi

# Get billing info for the project
billing_info=$(gcloud beta billing projects describe "$current_project" --format=json 2>/dev/null)

if [[ -z "$billing_info" ]]; then
    echo "⚠️ Failed to get billing information for project $current_project"
    exit 1
fi

# Parse billing info
billing_enabled=$(echo "$billing_info" | jq -r '.billingEnabled')
billing_account=$(echo "$billing_info" | jq -r '.billingAccountName')

if [[ "$billing_enabled" == "true" && -n "$billing_account" ]]; then
    echo "✅ Billing is enabled on project $current_project"
    echo "   Linked billing account: $billing_account"
else
    echo "⚠️ Billing is NOT enabled on project $current_project"
    if [[ -z "$billing_account" || "$billing_account" == "null" ]]; then
        echo "   No billing account linked"
    else
        echo "   Billing account linked but billing disabled: $billing_account"
    fi
fi
