import 'package:konax_posts/features/posts/data/model/posts_model.dart';



abstract class PostDetailsRepo{

  Future<PostsModel> getPostDetailsRepo(int id);

}