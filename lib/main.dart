import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movix/services/services.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc.dart';
import 'ui/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PageBloc(),
          ),
          BlocProvider(
            create: (context) => UserBloc(),
          ),
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
          BlocProvider(
            create: (context) => MovieBloc()..add(FetchMovie()),
          ),
          BlocProvider(
            create: (context) => MovieDetailBloc(),
          ),
          BlocProvider(
            create: (context) => CreditBloc(),
          ),
          BlocProvider(
            create: (context) => TheaterBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeState.themeData,
              initialRoute: MainPage.ROUTE_NAME,
              routes: {
                MovieDetailPage.ROUTE_NAME: (context) => MovieDetailPage(
                      movie: ModalRoute.of(context).settings.arguments,
                    ),
                SelectSchedulePage.ROUTE_NAME: (context) => SelectSchedulePage(
                      movieDetail: ModalRoute.of(context).settings.arguments,
                    ),
                SelectSeatPage.ROUTE_NAME: (context) => SelectSeatPage(
                      ticket: ModalRoute.of(context).settings.arguments,
                    )
              },
              home: Scaffold(
                body: SplashPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
