#!/usr/bin/fish
date > /tmp/usedstamp
if test $PARALLELISM = ""
    set -x PARALLELISM 64
end
cd /ArangoDB
rm -rf build
mkdir -p build
mkdir -p .ccache
cd build
set -x CCACHE_DIR /ArangoDB/.ccache
cmake $argv -DCMAKE_CXX_COMPILER=/usr/lib/ccache/bin/g++ -DCMAKE_C_COMPILER=/usr/lib/ccache/bin/gcc -DUSE_JEMALLOC=Off -DSTATIC_EXECUTABLES=On ..
nice make -j$PARALLELISM
