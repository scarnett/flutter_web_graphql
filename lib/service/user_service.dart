import 'package:flutter_web_graphql/models/models.dart';
import 'package:flutter_web_graphql/service/service.dart';
import 'package:graphql/client.dart';

const String fetchUsersQueryStr = r'''
  query UsersQuery {
    users {
      id
      first_name
      last_name
      email
    }
  }
''';

const String createUserMutationStr = r'''
  mutation ($user: users_insert_input!) {
    insert_users_one(
      object: $user
    ) {
      id
      first_name
      last_name
      email
    }
  }
''';

const String updateUserMutationStr = r'''
  mutation ($identifier: Int!, $user: users_set_input!) {
    update_users_by_pk(pk_columns: {id: $identifier}, _set: $user) {
      id
      first_name
      last_name
      email
    }
  }
''';

const String deleteUserMutationStr = r'''
  mutation ($identifier: Int!) {
    delete_users(where: {id: {_eq: $identifier}}) {
      affected_rows
    }
  }
''';

Future<List<User>> fetchUsers() async {
  try {
    GraphQLService service = GraphQLService();
    final QueryResult result = await service.performQuery(
      fetchUsersQueryStr,
      variables: {},
    );

    if (result.hasException) {
      print({
        'graphql': result.exception?.graphqlErrors.toString(),
        'link': result.exception?.linkException.toString(),
      });
    } else {
      return User.fromJsonList(result.data!['users']);
    }
  } catch (e) {
    print(e.toString());
  }

  return [];
}

Future<User?> createUser(
  User user,
) async {
  try {
    GraphQLService service = GraphQLService();
    final QueryResult result = await service.performMutation(
      createUserMutationStr,
      variables: {
        'user': user.toJson(),
      },
    );

    if (result.hasException) {
      print({
        'graphql': result.exception?.graphqlErrors.toString(),
        'link': result.exception?.linkException.toString(),
      });
    } else {
      return User.fromJson(result.data!['insert_users_one']);
    }
  } catch (e) {
    print(e.toString());
  }

  return null;
}

Future<User?> updateUser(
  User user,
) async {
  try {
    GraphQLService service = GraphQLService();
    final QueryResult result = await service.performMutation(
      updateUserMutationStr,
      variables: {
        'identifier': user.id,
        'user': user.toJson(),
      },
    );

    if (result.hasException) {
      print({
        'graphql': result.exception?.graphqlErrors.toString(),
        'link': result.exception?.linkException.toString(),
      });
    } else {
      return User.fromJson(result.data!['update_users_by_pk']);
    }
  } catch (e) {
    print(e.toString());
  }

  return null;
}

Future<void> deleteUser(
  User user,
) async {
  try {
    GraphQLService service = GraphQLService();
    final QueryResult result = await service.performMutation(
      deleteUserMutationStr,
      variables: {
        'identifier': user.id,
      },
    );

    if (result.hasException) {
      print({
        'graphql': result.exception?.graphqlErrors.toString(),
        'link': result.exception?.linkException.toString(),
      });
    }
  } catch (e) {
    print(e.toString());
  }
}
