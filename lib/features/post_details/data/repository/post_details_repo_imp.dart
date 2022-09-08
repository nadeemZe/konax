import '../../../../core/error/exceptions.dart';
import '../../../../core/external/network_checker.dart';
import '../../../posts/data/model/posts_model.dart';
import '../../domain/repository/post_details_repo.dart';
import '../data_sources/post_details_remote_source.dart';

class PostDetailsRepoImp implements PostDetailsRepo{
  PostDetailsRemoteSource postDetailsRemoteSource;
  NetworkChecker networkChecker;
  PostDetailsRepoImp({required this.postDetailsRemoteSource,required this.networkChecker});

  @override
  Future<PostsModel> getPostDetailsRepo(int id) async{
    if(await networkChecker.online){
      return await postDetailsRemoteSource.getPostDetailsRemoteSource(id);
    }
    else{
      throw ServerException();
    }

  }

}