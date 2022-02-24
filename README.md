# Angelswing Flutter Dev Test

## Getting Started

Before running this project make sure to configure the following tools and API's.

##### Tools and API Used :

| Tools              | Version                                                             |
| ------------------ | ------------------------------------------------------------------- |
| Flutter SDK        | Stable 2.10.0                                                       |
| Dart SDK           | Stable 2.15.1                                                       |
| IDE                | Visual Studio Code / Android Studio, XCode                          |
| System OS          | Windows / Linux / MacOS                                             |
| Device             | Android emulator / iOS simulator or physical device ( recommended ) |
| Google Map Api Key | https://cloud.google.com/maps-platform/                             |

##### Plugins and Packages Used :

###### HTTPs & Connectivity :

- [dio: ^4.0.4](https://pub.dev/packages/dio)

###### State Management and Dependency Injection :

- [flutter_riverpod: ^1.0.3](https://pub.dev/packages/flutter_riverpod)

###### Code and Data Class Generation with Functional Programming :

- [dartz: ^0.10.1](https://pub.dev/packages/dartz)
- [freezed_annotation: ^1.1.0](https://pub.dev/packages/freezed_annotation)
- [freezed: ^1.1.1](https://pub.dev/packages/freezed)
- [json_annotation: ^4.4.0](https://pub.dev/packages/json_annotation)
- [json_serializable: ^6.1.4](https://pub.dev/packages/json_serializable)
- [build_runner: ^2.1.7](https://pub.dev/packages/build_runner)

###### Map & Location :

- [google_maps_flutter: ^2.1.1](https://pub.dev/packages/google_maps_flutter)
- [geolocator: ^8.2.0](https://pub.dev/packages/geolocator)
- [freezed: ^1.1.1](https://pub.dev/packages/freezed)
- [json_annotation: ^4.4.0](https://pub.dev/packages/json_annotation)

###### Local storage :

- [shared_preferences: ^2.0.13](https://pub.dev/packages/shared_preferences)

###### Permissions :

- [permission_handler: ^9.2.0](https://pub.dev/packages/permission_handler)

###### Linting :

- [very_good_analysis: ^2.4.0](https://pub.dev/packages/very_good_analysis)

##### Running the project

Navigate to [code repository](https://github.com/roshandroids/angelswing_dev_test) and clone the project. Then follow the steps to run the project.

- Open the project folder in your choosen IDE.
- Open your terminal and run the commands : `Flutter clean ` and `Flutter pub get` to download and install all the dependencies.
- Navigate to `iOS folder` in your terminal and run `pod install` ( If you are building for iOS platform only ).
- To add `Google Map Api Key` for `android` navigate to `android > app > src > main > res > values > keys.xml` and add your key. And for `iOS` navigate to `ios > runner > AppDelegate.swift` and add your key.
- Start your device i.e `Android Emulator` or `iOS Simulator` or `Physical Device`.
- Open terminal and run `Flutter run` command to build your project.

##### Video Snippet :

- Follow this link to [watch video](https://youtu.be/VYqBhu_Ie38).
