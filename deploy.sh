#!/bin/bash

case $(uname -m) in
        x86_64)
                ./bin/dotter-linux-x64-musl "$@"
                ;;
        aarch64)
                ./bin/dotter-linux-arm64-musl "$@"
                ;;
        *)
                echo "unknown architecture"
                ;;
esac
