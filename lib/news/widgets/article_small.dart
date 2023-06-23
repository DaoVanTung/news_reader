import 'package:flutter/material.dart';

import '../news_model.dart';

class ArticleSmall extends StatelessWidget {
  const ArticleSmall({
    super.key,
    required this.article,
    required this.size,
  });

  final Article article;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: size.width - 16,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                article.urlToImage ?? '',
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                article.title ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
