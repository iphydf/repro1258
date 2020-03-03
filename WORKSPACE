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
    sha256 = "2a8503af332e685eb3602f1041016b4bbf7509c1029dc519f6b9e059e9a6d5db",
    version = "b41234677c9381982aae98098fb473a5b733c945",
)

load("@rules_haskell//haskell:ghc_bindist.bzl", "haskell_register_ghc_bindists")
load("@rules_haskell//haskell:repositories.bzl", "haskell_repositories")
load("//third_party/haskell:haskell.bzl", "new_cabal_package")

haskell_repositories()

# This repository rule creates @ghc repository.
haskell_register_ghc_bindists(
    version = "8.4.4",
)

github_archive(
    name = "ai_formation_hazel",
    repo = "FormationAI/hazel",
    sha256 = "605c83e0bf54c0517413096403ccb7799d6278fdeffdbe1555d11265e8165b17",
    version = "ecf380e97cc2e2114f359c89e4d65cd9c6b0ca22",
)

load("@ai_formation_hazel//:hazel.bzl", "hazel_repositories")
load("//third_party/haskell:packages.bzl", "core_packages", "packages")

# TODO(iphydf): Enable this once hazel is good enough to do automatically what
# we do manually in third_party/haskell.
#hazel_repositories(
#    core_packages = core_packages,
#    packages = packages,
#)

[new_local_repository(
    name = "haskell_%s" % pkg.replace("-", "_"),
    build_file = "third_party/haskell/BUILD." + pkg,
    path = "/usr",
) for pkg in core_packages.keys()]

[new_cabal_package(
    package = "%s-%s" % (
        pkg,
        data.version,
    ),
    sha256 = data.sha256,
) for pkg, data in packages.items()]
