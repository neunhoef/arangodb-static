This is a Docker image and helper scripts to compile ArangoDB and produce
completely static binaries for Linux.

Use as follows:

Issue

    docker run -d --rm -v (pwd):/ArangoDB --name arangodb-static neunhoef/arangodb-static

once to start the build container. Then start a shell in the container:

    docker exec -it arangodb-static fish

In that shell you can simply do:

    cd /ArangoDB
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DUSE_MAINTAINER_MODE=Off -DCMAKE_CXX_COMPILER=/usr/lib/ccache/bin/g++ -DCMAKE_C_COMPILER=/usr/lib/ccache/bin/gcc -DUSE_JEMALLOC=Off -DSTATIC_EXECUTABLES=On ..
    nice make -j12

for example. This exact action can also be achieved by

    docker exec -e CMAKE="-DCMAKE_BUILD_TYPE=RelWithDebInfo -DUSE_MAINTAINER_MODE=Off" -it arangodb-static /scripts/build.fish -j12

