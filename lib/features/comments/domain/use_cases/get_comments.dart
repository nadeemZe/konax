

import '../../data/model/comments_model.dart';
import '../repository/comments_repo.dart';

class GetCommentsUseCase{

  CommentsRepo commentsRepo;

  GetCommentsUseCase({required this.commentsRepo});

  Future<List<CommentsModel>> getComments(int id){
    return commentsRepo.getCommentsRepo(id);
  }

}