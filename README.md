# rules_android_app_bundles

Bazel rules providing [App Bundle Support](https://developer.android.com/guide/app-bundle) to your Bazel Android projects.
These rules are not meant to be a long term solutions, and will be deprecated once the `rule_android` Starlark migration
is complete.

Progress for native app bundle support can be tracked [here](https://github.com/bazelbuild/bazel/issues/11497).

## Usage

```python
load("@rules_android_app_bundles//android:android_application.bzl", "android_application", "deployable_android_application")

android_application(
    # android_binary arguments
    name = "android_app",
    custom_package = "com.app.bundle.example",
    manifest = "src/main/java/com/app/bundle/example/AndroidManifest.xml",
    resource_files = glob(["src/main/java/com/app/bundle/example/res/**"]),
    deps = [":lib"],
    proguard_generate_mapping = True|False,
    progard_specs = [":proguard_spec"]|None
    # android_application app bundle arguments
    app_bundle_config_file = "//:bundle_config",
)

deployable_android_application(
    name = "install_android_app_aab",
    aab_target = ":android_app_aab",
)
```

The following targets will be created:

```
//:android_app_aab
//:android_app_deployable
//:android_app_module_aab
//:android_app_module_zip
//:android_app_univeral_apks
//:install_android_app_aab
```

To build the app bundle with Bazel:

```console
bazel build //:android_app_aab
```

To get a universal APK generated from the app bundle:

```console
bazel build //:android_app_univeral_apks
```

To install the generated app bundle on a device or emulator:

```console
bazel run //:install_android_app_aab
```

## Acknowledgements

These rules are forked out of the [oppia-android](https://github.com/oppia/oppia-android/pull/3750) project. Credit goes
to [Ben Henning](https://github.com/BenHenning) and [Alex Humesky](https://github.com/ahumesky) for their work porting
these rules out of the alpha rules_android Starlark implementation.
