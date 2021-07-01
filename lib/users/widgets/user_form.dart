import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_graphql/app_theme.dart';
import 'package:flutter_web_graphql/bloc/app_bloc.dart';
import 'package:flutter_web_graphql/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserForm extends StatelessWidget {
  final User? user;

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;

  UserForm({
    Key? key,
    this.user,
  }) : super(key: key) {
    firstNameController = TextEditingController();
    firstNameController.text = this.user?.firstName ?? '';

    lastNameController = TextEditingController();
    lastNameController.text = this.user?.lastName ?? '';

    emailController = TextEditingController();
    emailController.text = this.user?.email ?? '';
  }

  @override
  Widget build(
    BuildContext context,
  ) =>
      AlertDialog(
        scrollable: true,
        title: Text((user == null) ? 'Create User' : 'Edit User'),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (user?.id != null)
                Tooltip(
                  message: 'Delete User',
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    color: AppTheme.danger,
                    onPressed: () => _tapDeleteUser(context),
                  ),
                ),
              if (user?.id == null) Container(),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () => _tapSaveUser(context),
                ),
              ),
            ],
          ),
        ],
      );

  void _tapSaveUser(
    BuildContext context,
  ) =>
      context.read<AppBloc>()
        ..add(
          SaveUser(
            context,
            User(
              id: user?.id,
              firstName: firstNameController.text,
              lastName: lastNameController.text,
              email: emailController.text,
            ),
          ),
        );

  void _tapDeleteUser(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Delete User?'),
        content: Text('Are you sure you want to delete this user?'),
        actions: [
          TextButton(
            child: Text(
              'No',
              style: TextStyle(color: AppTheme.danger),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text('Yes'),
            onPressed: () => context.read<AppBloc>().add(DeleteUser(context)),
            style: ElevatedButton.styleFrom(primary: AppTheme.danger),
          ),
        ],
      ),
    );
  }
}
