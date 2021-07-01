import 'package:graphql/client.dart';
import 'package:flutter_web_graphql/env_config.dart';

class GraphQLService {
  late GraphQLClient _client;

  GraphQLService() {
    HttpLink link = HttpLink(EnvConfig.GRAPHQL_URL);
    _client = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );
  }

  Future<QueryResult> performQuery(
    String query, {
    required Map<String, dynamic> variables,
  }) async {
    QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables,
    );

    final QueryResult result = await _client.query(options);
    return result;
  }

  Future<QueryResult> performMutation(
    String query, {
    required Map<String, dynamic> variables,
  }) async {
    MutationOptions options = MutationOptions(
      document: gql(query),
      variables: variables,
    );

    final QueryResult result = await _client.mutate(options);
    return result;
  }
}
