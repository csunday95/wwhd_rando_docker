mkdir -p build && cd build && rm -rf *
cmake -DCMAKE_TOOLCHAIN_FILE=$DEVKITPRO/wut/share/wut.toolchain.cmake ../
make