import 'package:epam_test/src/domain/models/requests/braking_news_request.dart';
import 'package:epam_test/src/domain/models/responses/breaking_news_response.dart';

import '../../utils/resources/data_state.dart';

abstract class ApiRepository {
  Future<DataState<BreakingNewsResponse>> getBreakingNewsArticles({
    required BreakingNewsRequest request,
  });
}
