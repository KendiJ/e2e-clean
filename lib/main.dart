import 'package:epam_test/src/config/router/app_router.dart';
import 'package:epam_test/src/config/themes/app_themes.dart';
import 'package:epam_test/src/domain/repositories/api_repository.dart';
import 'package:epam_test/src/locator.dart';
import 'package:epam_test/src/presentation/cubits/cubit/remote_articles_cubit.dart';
import 'package:epam_test/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:oktoast/oktoast.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RemoteArticlesCubit(
            locator<ApiRepository>(),
          )..getBreakingNewsArticles()
        )
      ],
      child: OKToast(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          title: appTitle,
          theme: AppThemes.light,
        ),
      ),
    );
  }
}
