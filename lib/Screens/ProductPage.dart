import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:reiscanada/Common/SharedPreferenceHelper.dart';
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
    CookieManager cookieManager = CookieManager.instance();

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
          onNavigationRequest: (NavigationRequest requestNav) {
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
    /*  return WebViewWidget(
      controller: controller,
    );*/
    /*return InAppWebView(
      initialUrl: "https://github.com/",
      initialHeaders: {'My-Custom-Header': 'custom_value=564hgf34'},
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
            debuggingEnabled: true, useShouldOverrideUrlLoading: true),
      ),
      onWebViewCreated: (InAppWebViewController controller) {
        webView = controller;
      },
      onLoadStart: (InAppWebViewController controller, String url) {},
      onLoadStop: (InAppWebViewController controller, String url) async {
        List<Cookie> cookies = await _cookieManager.getCookies(url: url);
        cookies.forEach((cookie) {
          print(cookie.name + " " + cookie.value);
        });
      },
      shouldOverrideUrlLoading:
          (controller, shouldOverrideUrlLoadingRequest) async {
        print("URL: ${shouldOverrideUrlLoadingRequest.url}");

        if (Platform.isAndroid ||
            shouldOverrideUrlLoadingRequest.iosWKNavigationType ==
                IOSWKNavigationType.LINK_ACTIVATED) {
          controller.loadUrl(
              url: shouldOverrideUrlLoadingRequest.url,
              headers: {'My-Custom-Header': 'custom_value=564hgf34'});
          return ShouldOverrideUrlLoadingAction.CANCEL;
        }
        return ShouldOverrideUrlLoadingAction.ALLOW;
      },
    );*/
    _onSetCookie(controller);
    return InAppWebView(
      onLoadStop: (InAppWebViewController controller, Uri? url) async {
        /*List<Cookie> cookies = await cookieManager.(url: url);
          cookies.forEach((cookie) {
            print(cookie.name + " " + cookie.value);
          });*/
        print(controller.webStorage.sessionStorage);
      },
      initialUrlRequest: URLRequest(
          url: Uri.parse(
              'https://reiscanada.app/Home/CalculatedResults?OrderId=$OrderId'),
          headers: <String, String>{'IsMobile': 'true'}),
    );
  }

  Future<void> _onSetCookie(WebViewController controller) async {
    await cookieManager.setCookie(WebViewCookie(
      domain: "https://reiscanada.app/",
      name: "UserUnicKeyForReisCanada",
      value: await SharedPreferencesHelper.getToken() as String,
    ));

    await cookieManager.setCookie(WebViewCookie(
      domain: "https://reiscanada.app/",
      name: "UserIdForReisCanada",
      value: (await SharedPreferencesHelper.getUserId()).toString(),
    ));

    await cookieManager.setCookie(const WebViewCookie(
      domain: "https://reiscanada.app/",
      name: "IsMobile",
      value: "true",
    ));
  }
}
