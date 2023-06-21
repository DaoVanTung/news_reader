import 'package:flutter/material.dart';

import '../news_model.dart';

class ArticleTopHeadline extends StatelessWidget {
  const ArticleTopHeadline({
    super.key,
    required this.size,
    required this.article,
  });

  final Size size;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 280,
        width: size.width - 16,
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                article.urlToImage ?? '',
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.red,
                  );
                },
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    article.title ?? '',
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    article.description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
