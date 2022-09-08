import 'package:konax_posts/features/posts/data/model/posts_model.dart';



abstract class PostsRepo{

  Future<List<PostsModel>> getPostsRepo(int page);

}