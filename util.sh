say() {
    printf '%s\n' "$0: $1" >&2
}

die() {
    say "$1"
    exit 1
}

has_command() {
    command -v $1 >/dev/null
}

ensure_has_commands() {
    for cmd in $@; do
        has_command $cmd || die "missing \`$cmd\` command"
    done
}

install_package() {
    packages=$@
    if has_command pacman; then
        packages_to_install=""
        for package in $packages; do
            pacman -Qi $package || packages_to_install="$packages_to_install $package"
        done

        [ -n "$packages_to_install" ] && sudo pacman -S $packages_to_install
    elif has_command apt-get; then
        sudo apt-get install $packages
    else
        return 1
    fi

    return 0
}
