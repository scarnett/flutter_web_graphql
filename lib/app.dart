import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_graphql/app_theme.dart';
import 'package:flutter_web_graphql/bloc/bloc.dart';
import 'package:flutter_web_graphql/users/view/view.dart';

class App extends StatelessWidget {
  App({
    Key? key,
  });

  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocProvider(
        create: (BuildContext context) => AppBloc()..add(FetchUsers()),
        child: AppView(),
      );
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocBuilder<AppBloc, AppState>(
        builder: (
          BuildContext context,
          AppState state,
        ) =>
            Container(
          child: MaterialApp(
            home: UsersView(),
            theme: appThemeData,
          ),
        ),
      );
}
