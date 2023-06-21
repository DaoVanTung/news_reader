import 'package:flutter/material.dart';

import '../news_model.dart';

class NewsSection extends StatelessWidget {
  final double height;
  final List<Article> articles;
  final Widget? Function(BuildContext, int) itemBuilder;

  const NewsSection({
    super.key,
    required this.height,
    required this.articles,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articles.length,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
