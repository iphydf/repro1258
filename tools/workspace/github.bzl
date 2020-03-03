"""Abbreviations for (new_)http_archive for well-behaved GitHub repos."""

load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    _http_archive = "http_archive",
)

def github_archive(name, repo, version, sha256 = None):
    """http_archive but for GitHub downloads."""
    owner, repo = repo.split("/")
    _http_archive(
        name = name,
        sha256 = sha256,
        strip_prefix = "%s-%s" % (repo, version.replace("v", "")),
        urls = ["https://github.com/%s/%s/archive/%s.zip" % (owner, repo, version)],
    )
