#!/bin/bash

current_project=$(gcloud config get-value project 2>/dev/null)

# Check if project is unset
if [[ "$current_project" == "(unset)" || -z "$current_project" ]]; then
    echo "⚠️ No Google Cloud project is currently set."
    echo "   You can set it with:"
    echo "   gcloud config set project YOUR_PROJECT_ID"
    exit 1
fi

# Compare with expected
if [[ "$current_project" == "$MY_GPROJECT" ]]; then
    echo "✅ Google Cloud project is set up correctly: $current_project"
else
    echo "⚠️ Google Cloud project mismatch!"
    echo "   Expected: $MY_GPROJECT"
    echo "   Found:    $current_project"
fi
