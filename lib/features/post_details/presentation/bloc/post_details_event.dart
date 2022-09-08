abstract class PostDetailsEvent{}

class GetPostDetailsEvent extends PostDetailsEvent{
  final int id;
  GetPostDetailsEvent({required this.id});
}