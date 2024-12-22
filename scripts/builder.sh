#!/bin/bash
set -euo pipefail
set -x
trap 'echo "Error on line $LINENO"' ERR

BUILD_DIR=$(mktemp -d)

extract_source() {
    local source_file="$SOURCES_DIR/$src_tar"

    if [[ ! -f "$source_file" ]]; then
        echo "Error: Source file $source_file not found"
        exit 1
    fi

    echo "Extracting $src_tar..."
    tar xf "$source_file" -C "$BUILD_DIR"
}

main() {
    local pkg_file="$1"
    source "$pkg_file"
    echo "Step $step_no: Build $pkg_name"
    extract_source

    pushd "$BUILD_DIR/${pkg_name}*"
    build
    popd
    rm -rf "$BUILD_DIR"
}

main "$@"
