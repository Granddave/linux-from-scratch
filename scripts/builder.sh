#!/bin/bash
set -euo pipefail
trap 'echo "Error on line $LINENO"' ERR
set -x

TMP_DIR=$(mktemp -d)


# Helper functions
ensure_var() {
    local var_name="$1"
    set +u
    if [[ -z "${!var_name}" ]]; then
        set -u
        echo "Error: $var_name is not set"
        exit 1
    fi
    set -u
}

ensure_fn() {
    local fn_name="$1"
    if [[ ! $(type -t "$fn_name") == "function" ]]; then
        echo "Error: $fn_name is not a function"
        exit 1
    fi
}

run_fn_if_exists() {
    local fn_name="$1"
    if [[ $(type -t "$fn_name") == "function" ]]; then
        set -x
        "$fn_name"
        set +x
    fi
}

unpack_phase() {
    # shellcheck disable=SC2154  # referenced but not assigned
    local source_file="$SOURCES_DIR/$pkg_tar"

    if [[ ! -f "$source_file" ]]; then
        echo "Error: Source file $source_file not found"
        exit 1
    fi

    echo "Extracting $source_file"
    tar xf "$source_file" -C "$TMP_DIR"
}

main() {
    local pkg_file="$1"

    # shellcheck disable=SC1090  # Use a directive to specify location.
    source "$pkg_file"

    ensure_var "SOURCES_DIR"
    ensure_var "step_no"
    # ensure_var "pkg_name"
    # ensure_var "pkg_tar"

    pkg_tar_is_defined=false
    set +u
    if [[ -n "${pkg_tar:-}" ]]; then
        pkg_tar_is_defined=true
    fi
    set -u

    # shellcheck disable=SC2154  # referenced but not assigned
    echo "Step $step_no"
    if [[ "$pkg_tar_is_defined" == true ]]; then
        unpack_phase
        BUILD_DIR=$(find "$TMP_DIR" -maxdepth 1 -type d -iname "${pkg_name}*")
        test -d "$BUILD_DIR" || {
            echo "Error: Build directory not found after unpacking"
            exit 1
        }
        export BUILD_DIR
        echo "Build directory: $BUILD_DIR"
        pushd "$BUILD_DIR"
        run_fn_if_exists "patch_phase"
        run_fn_if_exists "build_phase"
        popd # $BUILD_DIR
    else
        run_fn_if_exists "build_phase"
    fi
}

main "$@"
