import 'package:flutter/material.dart';
import 'package:flutter_develop_app/page/sample_page.dart';
import 'package:flutter_develop_app/page/webview_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutterサンプル画面HOME'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SamplePage(
                          title: '初回サンプルページ',
                        )),
              );
            },
            child: const Text('プロジェクト作成時サンプル画面'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WebviewPage()),
              );
            },
            child: const Text('webviewPage'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('無限スクロールPage'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('ログインPage'),
          ),
        ],
      ),
    );
  }
}
