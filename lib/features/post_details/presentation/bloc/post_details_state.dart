import '../../../posts/data/model/posts_model.dart';

abstract class PostDetailsState{}

class PostDetailsInit extends PostDetailsState{}
class PostDetailsLoading extends PostDetailsState{}
class PostsDetailsError extends PostDetailsState{}

class PostDetailsDone extends PostDetailsState{
  PostsModel postsModel;
  PostDetailsDone({required this.postsModel});
}