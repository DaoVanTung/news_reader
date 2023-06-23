import 'package:flutter/material.dart';

import '../news_model.dart';

class ArticleDetail extends StatelessWidget {
  const ArticleDetail({
    super.key,
    required this.article,
  });
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              article.urlToImage ?? '',
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    article.title ?? '',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    article.description ?? '',
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
