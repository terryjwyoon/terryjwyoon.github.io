#!/bin/bash
set -e

# Checkout master branch
git checkout master

# Merge develop branch with no fast-forward
git merge develop --no-ff --no-edit

# Push changes
git push --all

# Checkout develop branch again
git checkout develop