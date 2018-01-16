This is a Docker image and helper scripts to compile ArangoDB and produce
completely static binaries for Linux.

Use as follows:

    docker run -it --rm -v (pwd):/ArangoDB -e PARALLELISM=64 --name arangodb-static neunhoef/arangodb-static /scripts/build.sh -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_USE_ENTERPRISE=On


PLEASE NOTE:

For now, you have to use devel to compile, until the (small) changes in
there have been merged back to 3.3 and the other branches.
