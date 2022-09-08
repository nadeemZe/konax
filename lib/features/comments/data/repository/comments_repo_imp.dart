import '../../../../core/error/exceptions.dart';
import '../../../../core/external/network_checker.dart';
import '../../domain/repository/comments_repo.dart';
import '../data_sources/comments_remote_source.dart';
import '../model/comments_model.dart';

class CommentsRepoImp implements CommentsRepo{
  CommentsRemoteSource commentsRemoteSource;
  NetworkChecker networkChecker;
  CommentsRepoImp({required this.commentsRemoteSource,required this.networkChecker});

  @override
  Future<List<CommentsModel>> getCommentsRepo(int id) async{
    if(await networkChecker.online){
      return await commentsRemoteSource.getCommentsRemoteSource(id);
    }
    else{
      throw ServerException();
    }

  }

}