import '../../data/model/posts_model.dart';

abstract class PostsState{}

class PostsInit extends PostsState{}
class PostsLoading extends PostsState{}
class PostsError extends PostsState{}

class PostsDone extends PostsState{
  List<PostsModel> postsModel;
  PostsDone({required this.postsModel});
}