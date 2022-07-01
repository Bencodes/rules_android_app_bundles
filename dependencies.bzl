"""External dependencies required by rules_android_app_bundles"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_jar")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def download_app_bundle_dependencies():
    """Fetches the external app bundle dependencies.

  	"""

    maybe(
        http_jar,
        name = "bundletool_all",
        sha256 = "c42c365ae7369dd4dc2ebc11eeebf91459f0226c53706fd24de4d006268ab88c",
        urls = ["https://github.com/google/bundletool/releases/download/1.11.0/bundletool-all-1.11.0.jar"],
    )
