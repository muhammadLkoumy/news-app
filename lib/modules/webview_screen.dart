import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/bloc/states.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../layout/bloc/cubit.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  const WebViewScreen({Key? key, required this.url}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios, color: NewsCubit.get(context).isDark ? Colors.black : Colors.white,),
              ),
              title: Text("details".toUpperCase()),
            ),
            body: WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.disabled,

            ),
          );
        },
    );
  }
}
