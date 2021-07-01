part of 'app_bloc.dart';

@immutable
class AppState extends Equatable {
  final List<User> users;
  final User? activeUser;

  AppState({
    this.users: const [],
    this.activeUser,
  });

  const AppState._({
    this.users: const [],
    this.activeUser,
  });

  const AppState.initial() : this._();

  AppState copyWith({
    List<User>? users,
    Nullable<User?>? activeUser,
  }) =>
      AppState._(
        users: users ?? this.users,
        activeUser: (activeUser == null) ? this.activeUser : activeUser.value,
      );

  @override
  List<Object?> get props => [
        users,
        activeUser,
      ];

  @override
  String toString() => 'AppState{users: $users, activeUser: $activeUser}';
}
