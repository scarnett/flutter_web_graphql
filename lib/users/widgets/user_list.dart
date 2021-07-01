import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_graphql/bloc/bloc.dart';
import 'package:flutter_web_graphql/models/models.dart';

class UserList extends StatefulWidget {
  UserList({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(
    BuildContext context,
  ) =>
      BlocBuilder<AppBloc, AppState>(
        builder: (
          BuildContext context,
          AppState state,
        ) =>
            Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state.users.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              User user = state.users[index];
              return Column(
                children: [
                  ListTile(
                    leading: FlutterLogo(),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('${user.firstName} ${user.lastName}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline6),
                        Text(
                          user.email!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () =>
                          _tapEditUser(context: context, user: user),
                    ),
                  ),
                  Divider(),
                ],
              );
            },
          ),
        ),
      );

  void _tapEditUser({
    required BuildContext context,
    required User user,
  }) =>
      context.read<AppBloc>()
        ..add(SetActiveUser(user))
        ..add(ShowUserForm(context));
}
