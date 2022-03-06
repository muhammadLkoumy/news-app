import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:news/layout/bloc/cubit.dart';
import 'package:news/modules/webview_screen.dart';

Widget buildNewsScreen(list, context) {
  return BuildCondition(
    condition: list.isNotEmpty,
    builder: (context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => articleItem(context, list[index], index),
      separatorBuilder: (context, index) => separator(),
      itemCount: list.length,
    ),
    fallback: (context) => const Center(child: CircularProgressIndicator()),
  );
}

Widget articleItem(context, Map article, index) => InkWell(
  onTap: () {
    if (NewsCubit.get(context).isDesktop) {
      NewsCubit.get(context).changeSelectedItem(index);
    } else {
      navigateTo(context, WebViewScreen(url: article['url']));
    }
  },
  child: Container(
    color: NewsCubit.get(context).selectedItemIndex == index && NewsCubit.get(context).isDesktop ? Colors.grey.shade200 : null,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(
                  article['urlToImage'] ??
                      'https://www.besthosting.com/wp-content/uploads/2016/06/URL.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      article['title'],
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        height: 1.3,
                      ),
                    ),
                  ),
                  Text(
                    article['publishedAt'],
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);

Widget separator() => Container(
  height: 1,
  width: double.infinity,
  color: Colors.grey.shade300,
);

Object navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
