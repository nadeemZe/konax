import '../../data/model/comments_model.dart';

abstract class CommentsState{}

class CommentsInit extends CommentsState{}
class CommentsLoading extends CommentsState{}
class CommentsError extends CommentsState{}

class CommentsDone extends CommentsState{
  List<CommentsModel> commentsModel;
  CommentsDone({required this.commentsModel});
}