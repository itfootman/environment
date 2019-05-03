#! /bin/bash
ROOT=$(cd "$(dirname '$0')"; pwd)
echo "ROOT is $ROOT"
echo "Start install..."
cd bundle/command-t/ruby/command-t
ruby extconf.rb
make clean
make -j8

cd $ROOT/bundle/youcompleteme
python install.py
echo "Install complete."

