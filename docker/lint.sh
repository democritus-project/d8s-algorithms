#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_dates/ tests/

black democritus_dates/ tests/

mypy democritus_dates/ tests/

pylint democritus_dates/*.py

flake8 democritus_dates/ tests/

bandit -r democritus_dates/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_dates/ tests/
