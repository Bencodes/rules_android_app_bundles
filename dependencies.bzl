"""External dependencies required by rules_android_app_bundles"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_jar")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def download_app_bundle_dependencies():
    """Fetches the external app bundle dependencies.

  	"""

    maybe(
        http_jar,
        name = "bundletool_all",
        sha256 = "e740e7d38562c5e8d87cc817548b2db94e42802e9a0774fdf674e758ff79694d",
        urls = ["https://github.com/google/bundletool/releases/download/1.14.0/bundletool-all-1.14.0.jar"],
    )
