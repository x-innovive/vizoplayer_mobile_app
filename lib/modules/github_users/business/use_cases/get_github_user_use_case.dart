import 'package:vizoplayer/core/use_cases/no_param.dart';
import 'package:vizoplayer/core/use_cases/async_use_case.dart';
import 'package:vizoplayer/modules/github_users/business/entity/github_user.dart';
import 'package:vizoplayer/modules/github_users/business/repositories/github_users_repository.dart';

class GetGithubUserUseCase implements AsyncUseCase<List<GithubUser>, NoParam> {

  final GitHubUsersRepository githubUserRepository;

  const GetGithubUserUseCase({required this.githubUserRepository});

  @override
  Future<List<GithubUser>> execute(NoParam param) {
    return githubUserRepository.getUsers();
  }

}