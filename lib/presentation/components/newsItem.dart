import 'package:flutter/material.dart';
import 'package:newsapp/data/models/news.dart';
import 'package:newsapp/shared/Ui/AppText.dart';
import 'package:newsapp/shared/theme/app_color.dart';
class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        boxShadow:  [BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0,3),
        )],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  article.urlToImage ??
                      'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png',
                  fit: BoxFit.cover,
                  height: 150,
                ),
              )),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(text: article.title ?? "", fontWeight: FontWeight.bold, size: 15,),
                const SizedBox(height: 10),
                AppText(text: article.publishedAt ?? "", fontWeight: FontWeight.bold, size: 13,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}