import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_graphql/bloc/bloc.dart';
import 'package:flutter_web_graphql/users/widgets/widgets.dart';

class UsersView extends StatefulWidget {
  static Route route() => MaterialPageRoute<void>(builder: (_) => UsersView());

  UsersView({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  Widget build(
    BuildContext context,
  ) =>
      Scaffold(
        body: _buildContent(),
        extendBody: true,
        extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _tapAddUser(context),
          child: Icon(Icons.add),
        ),
      );

  Widget _buildContent() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Text(
              'Users',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Divider(),
          UserList(),
        ],
      ),
    );
  }

  void _tapAddUser(
    BuildContext context,
  ) =>
      context.read<AppBloc>()..add(ShowUserForm(context));
}
