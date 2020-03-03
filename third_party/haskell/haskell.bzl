"""Workspace rules for importing Haskell packages."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def new_cabal_package(package, sha256, url = None, strip_prefix = None):
    url = url or "https://hackage.haskell.org/package/%s/%s.tar.gz" % (package, package)
    strip_prefix = strip_prefix or package

    package_name, _ = package.rsplit("-", 1)

    http_archive(
        name = "haskell_%s" % package_name.replace("-", "_"),
        build_file = "@toktok//third_party/haskell:BUILD.%s" % package_name,
        sha256 = sha256,
        strip_prefix = strip_prefix,
        urls = [url],
    )
