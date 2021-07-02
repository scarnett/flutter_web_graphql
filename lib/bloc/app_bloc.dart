import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_graphql/app_theme.dart';
import 'package:flutter_web_graphql/models/models.dart';
import 'package:flutter_web_graphql/service/service.dart';
import 'package:flutter_web_graphql/users/widgets/widgets.dart';
import 'package:flutter_web_graphql/utils/common_utils.dart';

part 'app_events.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial());

  AppState get initialState => AppState.initial();

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is FetchUsers) {
      yield await _mapFetchUsersToStates(event);
    } else if (event is SetActiveUser) {
      yield _mapSetActiveUserToStates(event);
    } else if (event is ClearActiveUser) {
      yield _mapClearActiveUserToStates(event);
    } else if (event is ShowUserForm) {
      yield _mapShowUserFormToStates(event);
    } else if (event is SaveUser) {
      yield* _mapSaveUserToStates(event);
    } else if (event is DeleteUser) {
      yield* _mapDeleteUserToStates(event);
    }
  }

  Future<AppState> _mapFetchUsersToStates(
    FetchUsers event,
  ) async {
    List<User> users = await fetchUsers();
    return state.copyWith(
      users: users,
    );
  }

  AppState _mapSetActiveUserToStates(
    SetActiveUser event,
  ) =>
      state.copyWith(
        activeUser: Nullable<User?>(event.user),
      );

  AppState _mapClearActiveUserToStates(
    ClearActiveUser event,
  ) =>
      state.copyWith(
        activeUser: Nullable<User?>(null),
      );

  AppState _mapShowUserFormToStates(
    ShowUserForm event,
  ) {
    showDialog(
        context: event.context,
        builder: (
          BuildContext context,
        ) =>
            UserForm(user: state.activeUser)).then(
      (dynamic val) => add(ClearActiveUser()),
    );

    return state;
  }

  Stream<AppState> _mapSaveUserToStates(
    SaveUser event,
  ) async* {
    if (event.user.id == null) {
      User? user = await createUser(event.user);
      if (user != null) {
        List<User> users = List<User>.from(state.users)..add(user);
        yield state.copyWith(users: users);

        ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
          content: Text('User created successfully!'),
          backgroundColor: AppTheme.success,
        ));
      } else {
        ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
          content: Text('User was not saved. Please try again.'),
          backgroundColor: AppTheme.danger,
        ));
      }
    } else {
      List<User> users = List<User>.from(state.users);
      int userIndex =
          state.users.indexWhere((User user) => user.id == event.user.id);

      users[userIndex] = users[userIndex].copyWith(
        id: event.user.id,
        firstName: event.user.firstName,
        lastName: event.user.lastName,
        email: event.user.email,
      );

      yield state.copyWith(users: users);
      await updateUser(event.user);

      ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
        content: Text('User updated successfully!'),
        backgroundColor: AppTheme.success,
      ));
    }

    add(ClearActiveUser());
    Navigator.pop(event.context); // closes the dialog
  }

  Stream<AppState> _mapDeleteUserToStates(
    DeleteUser event,
  ) async* {
    List<User> users = List<User>.from(state.users);
    users.removeWhere((User user) => user.id == state.activeUser!.id);
    yield state.copyWith(users: users);
    await deleteUser(state.activeUser!);
    add(ClearActiveUser());

    ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
      content: Text('User deleted successfully!'),
      backgroundColor: AppTheme.success,
    ));

    // closes the dialogs
    Navigator.pop(event.context);
    Navigator.pop(event.context);
  }
}
