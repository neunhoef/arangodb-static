#!/usr/bin/fish
cd /ArangoDB
mkdir -p build
cd build
cmake $CMAKE -DCMAKE_CXX_COMPILER=/usr/lib/ccache/bin/g++ -DCMAKE_C_COMPILER=/usr/lib/ccache/bin/gcc -DUSE_JEMALLOC=Off -DSTATIC_EXECUTABLES=On ..
nice make $argv
