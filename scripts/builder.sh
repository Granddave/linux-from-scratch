#!/bin/bash
set -euo pipefail
trap 'echo "Error on line $LINENO"' ERR

BUILD_DIR=$(mktemp -d)

ensure_var() {
    local var_name="$1"
    if [[ -z "${!var_name}" ]]; then
        echo "Error: $var_name is not set"
        exit 1
    fi
}

ensure_fn() {
    local fn_name="$1"
    if [[ ! $(type -t "$fn_name") == "function" ]]; then
        echo "Error: $fn_name is not a function"
        exit 1
    fi
}

extract_source() {
    local source_file="$SOURCES_DIR/$src_tar"

    if [[ ! -f "$source_file" ]]; then
        echo "Error: Source file $source_file not found"
        exit 1
    fi

    echo "Extracting $source_file"
    tar xf "$source_file" -C "$BUILD_DIR"
}

main() {
    local pkg_file="$1"

    ensure_var "SOURCE_DIR"
    ensure_var "step_no"
    ensure_var "pkg_name"
    ensure_var "src_tar"
    ensure_fn "build"

    source "$pkg_file"
    echo "Step $step_no: Build $pkg_name"
    extract_source

    set -x
    pushd $(find "$BUILD_DIR" -maxdepth 1 -type d -iname "${pkg_name}*")
    build
    popd
}

main "$@"
