#!/bin/bash

git clone $2 build

if [[ ! -z "$1" ]]; then
    cd "build/$1"
fi

echo "Running makepkg from $PWD"
ls -la

pkg_deps=$(source ./PKGBUILD && echo ${makedepends[@]} ${depends[@]})
echo "Installing dependencies: $pkg_deps"
pacman -Syu --noconfirm $pkg_deps

chown -R builder "$PWD"

echo "Running makepkg"

# TODO: support extra flags

su --login builder --command='makepkg -fs ./PKGBUILD'

echo "Running namcap"

namcap -i *.pkg.tar.xz
