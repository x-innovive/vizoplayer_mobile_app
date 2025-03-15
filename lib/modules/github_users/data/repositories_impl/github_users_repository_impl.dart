import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:vizoplayer/infrastructure/network/api_urls.dart';
import 'package:vizoplayer/modules/github_users/data/data_sources/github_user_datasource.dart';

import '../../business/entity/github_user.dart';
import '../../business/repositories/github_users_repository.dart';
import 'package:http/http.dart' as http;

class GithubUsersRepositoryImpl implements GitHubUsersRepository {

  final GithubUsersDatasource datasource;

  GithubUsersRepositoryImpl({required this.datasource});

  @override
  Future<List<GithubUser>> getUsers() async {
    try {
      return datasource.getUsers();
    } catch (error, stck) {
      debugPrint(error.toString());
      debugPrint(stck.toString());
    }

    return [];
  }
}
