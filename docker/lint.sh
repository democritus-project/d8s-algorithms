#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_algorithms/ tests/

black democritus_algorithms/ tests/

mypy democritus_algorithms/ tests/

pylint --fail-under 9 democritus_algorithms/*.py

flake8 democritus_algorithms/ tests/

bandit -r democritus_algorithms/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_algorithms/ tests/
