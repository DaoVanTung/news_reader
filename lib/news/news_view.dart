import 'package:flutter/material.dart';

import 'widgets/article_small.dart';
import 'news_controller.dart';
import 'news_model.dart';
import 'widgets/article_top_headline.dart';
import 'widgets/news_section.dart';

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
                    NewsSection(
                      height: 280,
                      articles: model.articles,
                      itemBuilder: (context, index) {
                        final article = model.articles.elementAt(index);
                        return ArticleTopHeadline(
                          size: size,
                          article: article,
                        );
                      },
                    ),
                    NewsSection(
                      height: 140,
                      articles: model.articles,
                      itemBuilder: (context, index) {
                        final article = model.articles.elementAt(index);
                        return ArticleSmall(
                          article: article,
                          size: size,
                        );
                      },
                    ),
                    // NewsSection(
                    //   height: 180,
                    //   articles: model.articles,
                    //   itemBuilder: (context, index) {
                    //     final article = model.articles.elementAt(index);
                    //     return Container();
                    //   },
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
