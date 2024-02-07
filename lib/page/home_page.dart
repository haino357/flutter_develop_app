import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Flutterサンプル画面HOME'),
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sample');
                },
                child: const Text('プロジェクト作成時サンプル画面'),
              ),
              // タイトル

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/webview',
                  );
                },
                child: const Text('webviewPage'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('無限スクロールPage'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const LoginPage()),
                  // );
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('ログインPage'),
              ),
            ],
          ),
        ));
  }
}
