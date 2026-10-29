# Week 9 — Flutter testing and CI/CD

Start with a small working counter app. Add a rule, write small tests, and build
a GitHub Actions workflow one checkpoint at a time. The workflow will check the
code, run the tests, build an Android APK, and make it available to download.

**Start here for setup. Then follow [LAB.md](LAB.md).** The starter has only a
working **+** button. Tests, minus/reset buttons, and the workflow are added
during the activity; they are intentionally absent at the start.

## 1. Prepare your tools

- Install **Flutter 3.47.1 stable** with its bundled Dart SDK. CI uses this exact
  version too. Check `flutter --version` before class.
- Install **Git**, Android Studio, and an editor such as Android Studio or VS Code.
- In Android Studio's SDK Manager, install the Android SDK/platform tools and
  **Android SDK Platform 36**. Use the SDK/NDK versions requested by the supplied
  project if the first Android build prompts for additional components.
- Create an Android emulator in **Device Manager**, start it, and wait until its
  home screen is responsive. An Android phone with USB debugging also works.
- Have a **GitHub account** and a repository you can push to.

Run these commands in a terminal:

```text
flutter --version
git --version
flutter doctor
flutter doctor --android-licenses
flutter devices
```

Resolve problems in the Flutter and Android toolchain checks before starting.
For this Android activity, missing Xcode or Windows desktop build tools do not
prevent the required Android work. Use Java 17 or a compatible Android Studio
bundled JDK locally; GitHub's Android build explicitly uses Java 17.

## 2. Get your own working copy

### Fork this repository on GitHub

1. Fork [chakirouAlabani/flutter-ci](https://github.com/chakirouAlabani/flutter-ci) into your account.
2. Copy **your fork's HTTPS clone URL** from its Code button.
3. Replace `YOUR_FORK_URL` below with that complete URL:

```text
git clone YOUR_FORK_URL flutter-ci
cd flutter-ci
```

Do not push to the instructor's repository. Work on your own **main** branch.
If GitHub asks you to enable Actions in a fork, enable them from its Actions tab.

### If you receive a ZIP

Extract the ZIP, then open the project folder containing
`pubspec.yaml`, `README.md`, `LAB.md`, `lib`, and `android`.
The lab explains how to connect this folder to your own empty GitHub repository.

## 3. Run the starter locally

All project commands in this activity run from the folder containing
`pubspec.yaml`. Do not run them from `lib`, `android`, or `.github`.

```text
flutter pub get
flutter run
```

If Flutter offers several devices, select the **Android emulator**, not Windows
or a browser. You can also use the device ID shown by `flutter devices`:

```text
flutter run -d emulator-5554
```

The screen should show **Counter Lab**, a count of **0**, and a **+** button.
Tap **+** three times: the count should become **3**. A full app restart resets
the count to zero; this app deliberately has no persistence.

Leave this app running for the first lab checkpoint. Press **q** in the Flutter
terminal to stop a `flutter run` session when needed.

## Project map

| Location | Role |
| --- | --- |
| `lib/main.dart` | Supplied working app; you will add minus and reset |
| `lib/counter.dart` | Counter logic; created in the lab |
| `test/` | You will add unit and widget tests |
| `.github/workflows/ci-cd.yml` | You will create the workflow in stages |
| `android/` | Supplied Android project; keep it in Git |
| `pubspec.yaml` and `pubspec.lock` | Dependencies and their resolved versions; commit both |
| `LAB.md` | Step-by-step activity and supplied code |

## Local commands used later

After adding the tests in the lab:

```text
dart format lib test
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test
flutter build apk --debug
```

The first command applies formatting. The second checks it without changing
files and fails if formatting is needed. Unit and widget tests run without an
emulator. Building an APK packages the app; it does not run it on a device.

The debug APK is written to `build/app/outputs/flutter-apk/app-debug.apk`.
This activity delivers a **debug APK for classroom testing**. It does not publish
to Google Play or configure production signing. No cloud credentials, database,
Firebase account, or custom GitHub secret is required.

## Troubleshooting setup

| Symptom | What to check |
| --- | --- |
| `flutter` not recognized | Add the Flutter SDK's `bin` directory to PATH and reopen the terminal |
| Wrong SDK version | Use Flutter 3.47.1 so the local SDK matches the workflow |
| No Android device | Start an emulator, wait for Android to boot, then run `flutter devices` |
| Emulator installation or stop timeout | Stop Run/Debug; stop the emulator and use **Cold Boot Now**, then retry |
| Android licenses/build tools missing | Run `flutter doctor`, accept licenses, and complete SDK Manager setup |
| Gradle download appears slow | Keep internet access available; the first build downloads Android dependencies |
| `flutter test` finds no tests initially | Expected: create the tests at Checkpoints 3 and 4 first |

## References

- [Flutter installation](https://docs.flutter.dev/install)
- [Android setup for Flutter](https://docs.flutter.dev/platform-integration/android/setup)
- [Flutter testing](https://docs.flutter.dev/testing/overview)
- Teaching structure inspired by [MERN Notes README](https://github.com/chakirouAlabani/mern-notes/blob/main/README.md)
  and its [incremental student lab](https://github.com/chakirouAlabani/mern-notes/blob/main/docs/student-lab.md).
