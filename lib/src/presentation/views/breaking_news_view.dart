import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../domain/models/articles.dart';
import '../cubits/cubit/remote_articles_cubit.dart';

class BreakingNewsView extends HookWidget {
  const BreakingNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final remoteArticlesCubit = BlocProvider.of<RemoteArticlesCubit>(context);
    final scrollController = useScrollController();

    useEffect(
      () {
        scrollController.onScrollEndsListener(() {
          remoteArticlesCubit.getBreakingNewsArticles();
        });
        return scrollController.dispose;
      },
      const [],
    );
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Breaking News', style: TextStyle(color: Colors.black)),
      ),
      body: BlocBuilder<RemoteArticlesCubit, RemoteArticlesState>(
          builder: (_, state) {
        switch (state.runtimeType) {
          case RemoteArticlesLoading:
            return const Center(child: CupertinoActivityIndicator());
          case RemoteArticlesFailed:
            return const Center(child: Icon(Icons.refresh));
          case RemoteArticlesSuccess:
            return _buildArticles(
              scrollController,
              state.articles,
              state.noMoreData,
            );
          default:
            return const SizedBox();
        }
      }),
    );
  }

  Widget _buildArticles(
    ScrollController scrollController,
    List<Articles> articles,
    bool noMoreData,
  ) {
    return CustomControllView(
      controller: scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ArticleWidget(article: articles[index]),
            childCount: articles.length,
          ),
        ),
        if (!noMoreData)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 14, bottom: 32),
              child: Center(child: CupertinoActivityIndicator()),
            ),
          ),
      ],
    );
  }
  
}
