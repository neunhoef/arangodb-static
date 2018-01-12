#!/usr/bin/fish
if test $PARALLELISM = ""
    set -x PARALLELISM 64
end
cd /ArangoDB
mkdir -p build
cd build
cmake $argv -DCMAKE_CXX_COMPILER=/usr/lib/ccache/bin/g++ -DCMAKE_C_COMPILER=/usr/lib/ccache/bin/gcc -DUSE_JEMALLOC=Off -DSTATIC_EXECUTABLES=On ..
nice make -j$PARALLELISM
