<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Automate business operations, boost business growth and increase customer satisfaction with streamlined automation.

[Get Started](https://www.enif.ai/)

[Try a demo](https://www.enif.ai/demoRequest)

## Features
>Knowledge Base

## Getting started
Head to [Enif Website](https://www.enif.ai/) to create an account.

## Usage

Check the example folder for demo, click [here](https://sdk.enif.ai/) for live demo

Initialize your business ID, and specify environment

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 EnifController.setBusinessId("YOUR_BUSINESS_ID", Env.dev);

  runApp(const MyApp());
}

```
##### you can set user params to automatically login user

```dart
EnifController.setUser(EnifUserParams(
      firstName: "Sade",
      lastName: "Oluchi",
      phoneNo: "0803000000",
      email: "sade@enif.com"));
```

```dart

##### you can set deviceToken params to automatically add device token and receive push notifications

```dart
EnifController.setDeviceToken(
      "cft5xLfER0i4PeRZEupqqp:APA91bFmWW0LuTYF7dbAm7bxEMUGkUWE8hKilLA6HTdFHu-vCTQeYCRunXkPJBnzLk3Bh27VRGCIkM3M2U7SmQHsbkK7W3Kns4kQSoG6ZhSQHU2ihjcpFSASBxeoZ3Ff6cJSGu4FIsRC"
      );
```

```dart


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enif Chat Bot',
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const EnifHome(showBackButton: false),
    );
  }
}

```

## Additional information

