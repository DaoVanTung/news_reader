import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import 'widgets/article_detail.dart';
import 'widgets/article_small.dart';
import 'news_controller.dart';
import 'news_model.dart';
import 'widgets/article_top_headline.dart';
import 'widgets/news_section.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});
  static const String routeName = '/';

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
                        return OpenContainer(
                          transitionType: ContainerTransitionType.fadeThrough,
                          // transitionDuration: const Duration(seconds: 1),
                          closedBuilder: (context, action) {
                            return ArticleTopHeadline(
                              size: size,
                              article: article,
                            );
                          },
                          openBuilder: (context, action) {
                            return ArticleDetail(
                              article: article,
                            );
                          },
                        );
                        // return GestureDetector(
                        //   onTap: () {
                        // Navigator.pushNamed(context, '');
                        //   },
                        //   child: ArticleTopHeadline(
                        //     size: size,
                        //     article: article,
                        //   ),
                        // );
                      },
                    ),
                    NewsSection(
                      height: 140,
                      articles: model.articles,
                      itemBuilder: (context, index) {
                        final article = model.articles.elementAt(index);
                        return OpenContainer(
                          transitionType: ContainerTransitionType.fadeThrough,
                          // transitionDuration: const Duration(seconds: 1),
                          closedBuilder: (context, action) {
                            return ArticleSmall(
                              size: size,
                              article: article,
                            );
                          },
                          openBuilder: (context, action) {
                            return ArticleDetail(
                              article: article,
                            );
                          },
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
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
