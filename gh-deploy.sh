#!/bin/bash
set -e # exit with nonzero exit code if anything fails

# clear and re-create the out directory
rm -rf _out || exit 0;
mkdir _out;

# copy the needed stuffs
cp -r ./fonts _out/fonts
cp -r ./less _out/less
cp -r ./scss _out/scss
cp ./craft-ai-icons.json _out/craft-ai-icons.json
cp ./craft-ai-icons-preview.html _out/index.html

# go to the out directory and create a *new* Git repo
cd _out
git init

# inside this git repo we'll pretend to be a new user
git config user.name "Travis CI"
git config user.email "ops@craft.ai"

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Deploy to GitHub Pages"

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --force --quiet "https://${GH_TOKEN}@github.com/craft-ai/craft-ai-icons.git" master:gh-pages > /dev/null 2>&1
