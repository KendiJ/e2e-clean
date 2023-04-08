import 'package:dio/dio.dart';
import 'package:epam_test/src/domain/models/articles.dart';
import 'package:epam_test/src/domain/models/requests/braking_news_request.dart';
import 'package:epam_test/src/domain/repositories/api_repository.dart';
import 'package:epam_test/src/utils/resources/data_state.dart';
import 'package:equatable/equatable.dart';

import '../base/base_cubit.dart';

part 'remote_articles_state.dart';

class RemoteArticlesCubit extends BaseCubit<RemoteArticlesState, List<Articles>> {
  final ApiRepository _apiRepository;

  RemoteArticlesCubit(this._apiRepository)
      : super(const RemoteArticlesInitial(), []);

  int _page = 1;

  Future<void> getBreakingNewsArticles() async {
    if (isBusy) return;

    await run(() async {
      final response = await _apiRepository.getBreakingNews(
        request: BreakingNewsRequest(page: _page),
      );

      if(response is DataSuccess) {
        final articles = response.data.articles;
        final noMoreData = articles.length < 20;
        _page++;

        emit(RemoteArticlesSuccess(articles: data, noMoreData: noMoreData));
      } else if(response is DataFailed) {
        emit(RemoteArticlesFailed(error: response.error));
      }
    });
  }
}
