import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatelessWidget {
  const WebviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 表示するURL
    String url = 'https://flutter.dev';

    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // JavaScriptを有効化
      ..setBackgroundColor(const Color(0x00000000)) // 背景色を透明にする
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url)); // URLを指定して読み込む

    return Scaffold(
        appBar: AppBar(
          title: const Text('WebviewPage'),
        ),
        body: WebViewWidget(controller: controller));
  }
}
