

import '../../data/model/comments_model.dart';

abstract class CommentsRepo{

  Future<List<CommentsModel>> getCommentsRepo(int id);

}