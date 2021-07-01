part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class FetchUsers extends AppEvent {
  const FetchUsers();

  @override
  List<Object> get props => [];
}

class SetActiveUser extends AppEvent {
  final User user;

  SetActiveUser(
    this.user,
  );

  @override
  List<Object> get props => [user];
}

class ClearActiveUser extends AppEvent {
  const ClearActiveUser();

  @override
  List<Object> get props => [];
}

class ShowUserForm extends AppEvent {
  final BuildContext context;

  ShowUserForm(
    this.context,
  );

  @override
  List<Object> get props => [context];
}

class SaveUser extends AppEvent {
  final BuildContext context;
  final User user;

  SaveUser(
    this.context,
    this.user,
  );

  @override
  List<Object> get props => [
        context,
        user,
      ];
}

class DeleteUser extends AppEvent {
  final BuildContext context;

  DeleteUser(
    this.context,
  );

  @override
  List<Object> get props => [context];
}
