import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
        // デリゲート
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            // ページが読み込まれたときに動く処理を記載する
          },
          onPageFinished: (String url) async {
            //ページが読むこまれたときにする処理を記載
            // async/awaitを使用して非同期で処理したいことも書ける
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            // WebView内のリンクがクリックされたときの処理
            // WebView内のリンクのURLがhttpまたはhttpsで始まる場合はWebView内で遷移する
            if (request.url.startsWith('http') || request.url.startsWith('https')) {
              // webView内で遷移する
              return NavigationDecision.navigate;
            } else {
              // WebView内の外部リンクがクリックされた場合、外部アプリを開く
              launchExternalApp(request.url);
              // webView内で遷移しない
              return NavigationDecision.prevent;
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(url)); // URLを指定して読み込む
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('WebviewPage'),
        ),
        body: WebViewWidget(controller: controller));
  }

  Future<void> launchExternalApp(String url) async {
    if (await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalNonBrowserApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
