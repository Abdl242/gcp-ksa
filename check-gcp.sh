#!/bin/bash

current_project=$(gcloud config get-value project 2>/dev/null)

if [[ "$current_project" == "$MY_GPROJECT" ]]; then
    echo "✅ Google Cloud project is set up correctly: $current_project"
else
    echo "⚠️ Google Cloud project mismatch!"
    echo "   Expected: $MY_GPROJECT"
    echo "   Found:    $current_project"
fi
