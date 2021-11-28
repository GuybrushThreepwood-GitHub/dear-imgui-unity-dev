#!/usr/bin/env bash
# adapted from https://github.com/mellinoe/imgui.net-nativebuild

scriptPath="`dirname \"$0\"`"

_CMakeBuildType=Release

while :; do
    if [ $# -le 0 ]; then
        break
    fi

    lowerI="$(echo $1 | awk '{print tolower($0)}')"
    case $lowerI in
        debug|-debug)
            _CMakeBuildType=Debug
            ;;
        release|-release)
            _CMakeBuildType=Release
            ;;
        *)
            __UnprocessedBuildArgs="$__UnprocessedBuildArgs $1"
    esac

    shift
done

mkdir -p build/$_CMakeBuildType
pushd build/$_CMakeBuildType
cmake ../.. -DCMAKE_BUILD_TYPE=$_CMakeBuildType -DFT_DISABLE_ZLIB=TRUE -DFT_DISABLE_BZIP2=TRUE -DFT_DISABLE_PNG=TRUE -DFT_DISABLE_HARFBUZZ=TRUE -DFT_DISABLE_BROTLI=TRUE 
make -j4
popd
