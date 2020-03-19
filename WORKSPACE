workspace(name = "toktok")

load("//tools/workspace:github.bzl", "github_archive")

github_archive(
    name = "bazel_skylib",
    repo = "bazelbuild/bazel-skylib",
    sha256 = "d786769a4c9bfd9d5fe7933cf70d8c9da506a49c9f24a8471d64de2ac529274a",
    version = "6970e21d290ceaa36502d0c94533b26e5ec18c0b",
)

# Haskell
# =========================================================

github_archive(
    name = "rules_sh",
    repo = "tweag/rules_sh",
    sha256 = "93fb94bec4228971343b1ecbb303450ff323f52c768d60eeb3a445acfa6328ff",
    version = "0c274ad480ed3eade49250abd04ff71655a07820",
)

github_archive(
    name = "rules_haskell",
    repo = "tweag/rules_haskell",
    sha256 = "d19f234334807895329179a2a5bc6ddac4893b2fbd085cece7d820e870e5fb00",
    version = "d59ccf9e7785553fd392924fb083d926c7e01134",
)

load("@rules_haskell//haskell:ghc_bindist.bzl", "haskell_register_ghc_bindists")
load("@rules_haskell//haskell:repositories.bzl", "haskell_repositories")
load("//third_party/haskell:haskell.bzl", "new_cabal_package")

haskell_repositories()

# This repository rule creates @ghc repository.
haskell_register_ghc_bindists(
    version = "8.6.5",
)

load("//third_party/haskell:packages.bzl", "core_packages", "packages")

[new_local_repository(
    name = "haskell_%s" % pkg.replace("-", "_"),
    build_file = "third_party/haskell/BUILD." + pkg,
    path = "/usr",
) for pkg in core_packages.keys()]
