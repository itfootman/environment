#! /bin/bash
ROOT=$(cd "$(dirname '$0')"; pwd)
echo "ROOT is $ROOT"
echo "Start install..."
cd $ROOT/bundle/command-t/ruby/command-t
ruby extconf.rb
make clean
make -j8

if [ "$(uname)"=="Darwin" ]; then
    cp $ROOT/bundle/youcompleteme/third_party/ycmd/libclang-6.0.0-x86_64-apple-darwin.tar.bz2 \
       $ROOT/bundle/youcompleteme/third_party/ycmd/clang_archives
elif [ "$(expr substr $(uname -s) 1 5)"=="Linux" ]; then
    cp $ROOT/bundle/youcompleteme/third_party/ycmd/libclang-6.0.0-x86_64-linux-gnu-ubuntu-14.04.tar.bz2 \
       $ROOT/bundle/youcompleteme/third_party/ycmd/clang_archives
fi

cd $ROOT/bundle/youcompleteme
python install.py --all

cd $ROOT
if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi


cp $ROOT/environment/vimrc ~/.vimrc

echo "Install complete."

