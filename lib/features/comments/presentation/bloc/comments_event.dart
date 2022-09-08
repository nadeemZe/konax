abstract class CommentsEvent{}

class GetCommentsEvent extends CommentsEvent{
  final int id;
  GetCommentsEvent({required this.id});
}