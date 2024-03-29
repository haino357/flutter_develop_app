# flutter検証アプリ
技術検証のために作成したFlutterアプリ
下記に使用した技術を記載する。

## 現在の環境(2024/02/05時点)
- Flutter 3.16.9-stable
- Dart  3.2.6 (stable)
- Android Studio Electric Eel | 2022.1.1 Patch 2
- Xcode 12.5.1
- Android
  - targetSdkVersion 
  - compileSdkVersion
  - minSdkVersion
- iOS
  - 
- macOS Ventura 13.0.1

## 使用パッケージ
- [webview_flutter 4.5.0](https://pub.dev/packages/webview_flutter)
  - Webviewを使用するためのパッケージ
- [url_launcher 6.2.4](https://pub.dev/packages/url_launcher)
  - URLを開くためのパッケージ

## デザイン
### アプリ表示名の変更
アプリの表示名を変更するためには下記を変更する。
ios/Runner/Info.plist
```xml
<key>CFBundleName</key>
<string>アプリ名</string>
```
android/app/src/main/AndroidManifest.xml
```xml
<application
    android:label="アプリ名"
    android:icon="@mipmap/ic_launcher">
```

### マテリアルデザイン
マテリアルデザインのアプリを作成するために、MaterialAppを使用する。そのためには下記をimportする。
Android風のデザインを作成するために、MaterialAppを使用する。
```dart
import 'package:flutter/material.dart';
```
MaterialBottomNavigationのように、タブを切り替えるたびにページがビルドされるとなると、APIで情報を取得して表示しているページの場合、切り替えるたびにAPIリクエストを行い、ページを生成することになる。
情報の鮮度が高く保てますがその分APIの待ちなどで画面が生成できるまでユーザーに待ちの時間を作る可能性も発生

### カッパチーノデザイン
クパチーノデザインのアプリを作成するために、CupertinoAppを使用する。そのためには下記をimportする。
iOS風のデザインを作成するために、CupertinoAppを使用する。
```dart
import 'package:flutter/cupertino.dart';
```
CupertinoBottomNavigationの場合だと、他に画面更新のトリガーを入れない限り、最初に取得した情報のままになっている。
その場合には、pull_to_refresh などで行えるように画面を構築するのも良い。

### 今回の使用技術
今回は、マテリアルデザインのアプリをメインにするために、MaterialAppを使用する。

## Webview
- Webviewを使用するためには、webview_flutterを使用する。
- Androidでは、WebViewを使用するために、AndroidManifest.xmlに下記を追加する。
```xml
<uses-permission android:name="android.permission.INTERNET"/>
```
- iOSでは、Info.plistに下記を追加する。
```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

## リリース
### Android
#### エラー対応
##### バージョン コード 1 はすでに使用されています。別のバージョン コードをお試しください。
バージョンコードを変更するためには、android/app/build.gradleのversionCodeを変更する。
```gradle
def flutterVersionCode = localProperties.getProperty('flutter.versionCode')
// Androidのバージョンコードを設定
flutterVersionCode = '1'

// 中略

android {
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.flutter_develop_app.flutter_develop_app"
        minSdkVersion flutter.minSdkVersion
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }
}
```
### iOS