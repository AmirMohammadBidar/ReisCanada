import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProductPage extends StatefulWidget {
  final int OrderId;

  const ProductPage({Key? key, required this.OrderId}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState(OrderId);
}

class _ProductPageState extends State<ProductPage> {
  late final WebViewController controller;
  final int OrderId;
  final cookieManager = WebViewCookieManager();
  _ProductPageState(this.OrderId);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) async {},
          onPageStarted: (String url) async {},
          onPageFinished: (String url) async {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest requestNav) async {
            controller.loadRequest(Uri.parse(requestNav.url),
                headers: <String, String>{
                  'IsMobile': 'true',
                  'UserUnicKeyForReisCanada':
                      '103ZX9iI0DYZ092UUUhtodlp1TnR9x7M0kggXdw7zPmO918c7d924872a2c560ef01e2df',
                  'UserIdForReisCanada': '16'
                });
            /* print(requestNav.url);
            HttpClient httpClient = HttpClient();
            HttpClientRequest request =
                await httpClient.getUrl(Uri.parse(requestNav.url));
            request.cookies.add(Cookie('UserUnicKeyForReisCanada',
                (await SharedPreferencesHelper.getToken()) as String));
            request.cookies.add(Cookie('UserIdForReisCanada',
                (await SharedPreferencesHelper.getUserId()).toString()));
            HttpClientResponse response = await request.close();
            List<Cookie> cookies = response.cookies;
            controller.runJavaScript(
                'document.cookie = "${cookies[0].name}=${cookies[0].value}"');*/
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          Uri.parse(
              'https://reiscanada.app/Home/CalculatedResults?OrderId=$OrderId'),
          headers: <String, String>{
            'IsMobile': 'true',
            'UserUnicKeyForReisCanada':
                '103ZX9iI0DYZ092UUUhtodlp1TnR9x7M0kggXdw7zPmO918c7d924872a2c560ef01e2df',
            'UserIdForReisCanada': '16'
          });
    //_onSetCookie(controller);
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: controller,
    );
  }

  Future<void> _onSetCookie(WebViewController controller) async {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) async {},
          onPageStarted: (String url) async {},
          onPageFinished: (String url) async {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest requestNav) async {
            /* print(requestNav.url);
            HttpClient httpClient = HttpClient();
            HttpClientRequest request =
                await httpClient.getUrl(Uri.parse(requestNav.url));
            request.cookies.add(Cookie('UserUnicKeyForReisCanada',
                (await SharedPreferencesHelper.getToken()) as String));
            request.cookies.add(Cookie('UserIdForReisCanada',
                (await SharedPreferencesHelper.getUserId()).toString()));
            HttpClientResponse response = await request.close();
            List<Cookie> cookies = response.cookies;
            controller.runJavaScript(
                'document.cookie = "${cookies[0].name}=${cookies[0].value}"');*/
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          Uri.parse(
              'https://reiscanada.app/Home/CalculatedResults?OrderId=$OrderId'),
          headers: <String, String>{
            'IsMobile': 'true',
            'UserUnicKeyForReisCanada':
                '103ZX9iI0DYZ092UUUhtodlp1TnR9x7M0kggXdw7zPmO918c7d924872a2c560ef01e2df',
            'UserIdForReisCanada': '16'
          });
  }
}
