import 'package:flutter/material.dart';
import 'package:flutter_develop_app/page/home_page.dart';
import 'package:flutter_develop_app/page/login_page.dart';
import 'package:flutter_develop_app/page/sample_page.dart';
import 'package:flutter_develop_app/page/webview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // デバッグバナーを非表示
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        // 画面遷移ルーティングを記載する
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => const HomePage(),
          '/sample': (BuildContext context) => const SamplePage(
                title: '初回サンプルページ',
              ),
          '/login': (BuildContext context) => const LoginPage(),
          '/webview': (BuildContext context) => const WebviewPage(),
        });
  }
}
