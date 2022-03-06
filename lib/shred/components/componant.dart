import 'package:flutter/material.dart';
import 'package:news/modules/article_details.dart';

Widget articleView(article, context) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => WebviewPage(article['url'])));
      },
      child: Row(
        children: [
          Container(
            width: 120,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article['urlToImage'] ??
                    'https://www.codeur.com/tuto/wp-content/uploads/2020/11/img-html-950x500.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      article['title'],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    article['publishedAt'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget separator() {
  return Padding(
    padding: const EdgeInsets.only(left: 12, right: 12),
    child: Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey.shade300,
    ),
  );
}
