# Week 9 — Flutter testing and CI/CD

Start with a small working counter app. Add a rule, write small tests, and build
a GitHub Actions workflow one checkpoint at a time. The workflow will check the
code, run the tests, build an Android APK, and make it available to download.

**Start here for setup. Then follow [LAB.md](LAB.md).** The starter has only a
working **+** button. Tests, minus/reset buttons, and the workflow are added
during the activity; they are intentionally absent at the start.

## 1. Get your own working copy

### Fork this repository on GitHub 

1. Fork [chakirouAlabani/flutter-ci](https://github.com/chakirouAlabani/flutter-ci) into your account.
2. Copy **your fork's HTTPS clone URL** from its Code button.
3. Replace `YOUR_FORK_URL` below with that complete URL:

```text
git clone YOUR_FORK_URL flutter-ci
cd flutter-ci
```

Do not push to my repository. Work on your own **main** branch.
If GitHub asks you to enable Actions in a fork, enable them from its Actions tab.

### If you use a ZIP (Recommended)

Extract the ZIP, then open the project folder containing
`pubspec.yaml`, `README.md`, `LAB.md`, `lib`, and `android`.


## 2. Open and run in Android Studio

The screen should show **Counter Lab**, a count of **0**, and a **+** button.
Tap **+** three times: the count should become **3**. A full restart resets the
count to zero; this app deliberately has no persistence.

Once it runs, continue with **[LAB.md](LAB.md)**. Use Android Studio's **Stop**
button before starting another Run session.


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
This activity delivers a **debug APK for classroom testing**.
