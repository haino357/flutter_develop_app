import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Item> data = generateItems(5);

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
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text('ログインPage'),
              ),
              ElevatedButton(
                onPressed: () async {
                  const url =
                      'twitter://user?screen_name=hai_haino'; // <-Twitterアプリのユーザープロフ画面を開くURLScheme
                  launchUrl(
                    Uri.parse(url),
                    // mode: LaunchMode.externalNonBrowserApplication,  // Twitterアプリが開く
                    // mode: LaunchMode.platformDefault, // アプリに応じてデフォルトのアプリが開く
                    mode: LaunchMode.externalApplication, //
                  );
                },
                child: const Text('外部アプリを開く：Twitter'),
              ),
              // アコーディオンView
              ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                    title: Text(data[index].headerValue),
                    children: <Widget>[
                      ListTile(
                        title: Text(data[index].expandedValue),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ));
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
  });

  String expandedValue;
  String headerValue;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'アイテム $index',
      expandedValue: 'このアイテムの詳細情報',
    );
  });
}
