import 'package:konax_posts/core/external/network_checker.dart';
import 'package:konax_posts/features/posts/data/data_sources/posts_remote_source.dart';
import 'package:konax_posts/features/posts/data/model/posts_model.dart';
import 'package:konax_posts/features/posts/domain/repository/posts_repo.dart';
import '../../../../core/error/exceptions.dart';

class PostsRepoImp implements PostsRepo{
  PostsRemoteSource postsRemoteSource;
  NetworkChecker networkChecker;
  PostsRepoImp({required this.postsRemoteSource,required this.networkChecker});

  @override
  Future<List<PostsModel>> getPostsRepo(int page) async{
     if(await networkChecker.online){
      return await postsRemoteSource.getPostsRemoteSource(page);
     }
     else{
      throw ServerException();
     }

  }

}