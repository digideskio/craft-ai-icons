# Developers instructions #

## Install dependencies ##

On Unix (debian or ubuntu)

    npm run install_dependencies_unix

On Mac OS X ([homebrew](http://brew.sh/) needed)

    npm run install_dependencies_mac

## Build ##

    npm run build

## Releasing a new version (needs administrator rights) ##

1. Make sure the build of the master branch is passing
[![Build](https://img.shields.io/travis/craft-ai/craft-ai-icons/master.svg?style=flat-square)](https://travis-ci.org/craft-ai/craft-ai-icons)
2. Checkout the master branch locally
````sh
git fetch
git checkout master
git reset --hard origin/master
````
3. Bump the version and push
````sh
npm version patch
git push origin master
git push --tags
````
