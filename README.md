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

Do not push to the instructor's repository. Work on your own **main** branch.
If GitHub asks you to enable Actions in a fork, enable them from its Actions tab.

### If you receive a ZIP

Extract the ZIP, then open the project folder containing
`pubspec.yaml`, `README.md`, `LAB.md`, `lib`, and `android`.
The lab explains how to connect this folder to your own empty GitHub repository.

## 2. Open and run in Android Studio

1. In **Android Studio**, select **Open** and choose the project folder containing
   `pubspec.yaml`. Open the Flutter project root, not its `android` subfolder.
2. Install the project dependencies: click **Pub get** in `pubspec.yaml`, or run
   the following in Android Studio's terminal:

   ```text
   flutter pub get
   ```

3. Start your Android emulator in **Device Manager** and wait for its home screen.
4. Open **`lib/main.dart`**, select the emulator in the device selector, and click
   **Run ▶**. Wait for the app to install and open.

The screen should show **Counter Lab**, a count of **0**, and a **+** button.
Tap **+** three times: the count should become **3**. A full restart resets the
count to zero; this app deliberately has no persistence.

Once it runs, continue with **[LAB.md](LAB.md)**. Use Android Studio's **Stop**
button before starting another Run session. Run later terminal commands from
the project root containing `pubspec.yaml`.

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

## If the app does not start

- Confirm the selected device is your **Android emulator**.
- For an emulator timeout, stop Run/Debug, use **Cold Boot Now**, and retry.
- Allow the first build time to download its Android dependencies.

## References

- [Flutter testing](https://docs.flutter.dev/testing/overview)
- Teaching structure inspired by [MERN Notes README](https://github.com/chakirouAlabani/mern-notes/blob/main/README.md)
  and its [incremental student lab](https://github.com/chakirouAlabani/mern-notes/blob/main/docs/student-lab.md).
