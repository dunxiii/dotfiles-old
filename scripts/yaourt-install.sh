#!/bin/bash
# This script installs yaourt and it's dependency

mkdir -p /tmp/package-query
cd /tmp/package-query

echo "Retrieving package-query ..."
curl -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz

echo "Uncompressing package-query ..."
tar zxvf /tmp/package-query/package-query.tar.gz -C /tmp

echo "Installing package-query ..."
makepkg -si --noconfirm --needed

rm -r /tmp/package-query


mkdir -p /tmp/yaourt
cd /tmp/yaourt

echo "Retrieving yaourt ..."
curl -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz

echo "Uncompressing yaourt ..."
tar zxvf yaourt.tar.gz -C /tmp

echo "Installing yaourt ..."
makepkg -si --noconfirm --needed

rm -r /tmp/yaourt

echo "Done!"
