import 'package:flutter/material.dart';

import 'news_controller.dart';
import 'news_model.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NewsController();
    final model = NewsModel();

    return Scaffold(
      body: FutureBuilder(
        future: controller.fetchNews(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              final size = MediaQuery.of(context).size;
              return Scaffold(
                appBar: AppBar(
                  title: const Text('News'),
                ),
                body: Column(
                  children: [
                    NewsSection(height: 280, articles: model.articles),
                    NewsSection(height: 180, articles: model.articles),
                    NewsSection(height: 180, articles: model.articles),

                    // Container(
                    //   color: Colors.blue,
                    //   height: 180,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: model.articles.length,
                    //     itemBuilder: (context, index) {
                    //       final article = model.articles.elementAt(index);
                    //       return ArticleTopHeadline(
                    //         size: size,
                    //         article: article,
                    //       );
                    //     },
                    //   ),
                    // ),
                    // Container(
                    //   color: Colors.green,
                    //   height: 180,
                    // ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}

class NewsSection extends StatelessWidget {
  final double height;
  final List<Article> articles;
  // final Widget articleWidget;

  const NewsSection({
    super.key,
    required this.height,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles.elementAt(index);
          return ArticleTopHeadline(
            size: MediaQuery.of(context).size,
            article: article,
          );
        },
      ),
    );
  }
}

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
