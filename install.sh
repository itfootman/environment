#! /bin/bash
ROOT=`dirname $0`
echo "Start install..."
cd bundle/command-t/ruby/command-t
ruby extconf.rb
make -j8
cd  $ROOT

cd bundle/youcompleteme
python install.py
echo "Install complete."
