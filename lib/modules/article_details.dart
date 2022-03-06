import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/bloc/cubit.dart';
import 'package:news/layout/bloc/states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatelessWidget {

  final String url;

  const WebviewPage(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: NewsCubit.get(context).isDark ? Colors.black : CupertinoColors.white,),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              title: const Text('Details'),
            ),
            body: WebView(
              initialUrl: url,
            ),
          );
        },
    );
  }
}
