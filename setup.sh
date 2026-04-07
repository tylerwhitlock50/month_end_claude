#!/bin/bash

if [ ! -d .venv ]; then
    echo "Creating virtual environment"
    python -m venv venv
    echo "Activating virtual environment"
    source venv/Scripts/activate
    echo "Installing requirements"
    pip install -r requirements.txt
    echo "Setup complete"
else
    echo "Virtual environment already exists"
    echo "Activating virtual environment"
    source venv/Scripts/activate
    echo "Checking tags"
    python scripts/scan_tags.py
fi

python scripts/scan_tags.py > .result.txt
