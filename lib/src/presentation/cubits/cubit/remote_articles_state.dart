part of 'remote_articles_cubit.dart';

abstract class RemoteArticlesState extends Equatable {
final List<Article> articles;
final bool noMoreData;
final DioError? error;

  const RemoteArticlesState({
    this.articles = const [],
    this.noMoreData = true,
    this.error,
  });


  @override
  List<Object?> get props => [articles, noMoreData, error];
}

// class RemoteArticlesInitial extends RemoteArticlesState {
//   const RemoteArticlesInitial();
// }

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticlesSuccess extends RemoteArticlesState {
  const RemoteArticlesSuccess({required List<Article> articles, required bool noMoreData});
}
class RemoteArticlesFailed extends RemoteArticlesState {
  const RemoteArticlesFailed({required DioError error});
}