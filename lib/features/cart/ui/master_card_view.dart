import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MasterCardView extends StatefulWidget {
  const MasterCardView({super.key, required this.url});

  final String url;

  @override
  State<MasterCardView> createState() => _MasterCardViewState();
}

class _MasterCardViewState extends State<MasterCardView> {

  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {

            if(request.url.contains('success')){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Payment Success'),
                ),
              );
              Navigator.pop(context);
              Navigator.pop(context);
            }
            if(request.url.contains('fail')){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Payment Failed, Please try again'),
                ),
              );
              Navigator.pop(context);
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
    );
  }
}
