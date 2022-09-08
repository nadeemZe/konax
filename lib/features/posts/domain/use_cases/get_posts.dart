import 'package:konax_posts/features/posts/data/model/posts_model.dart';
import 'package:konax_posts/features/posts/domain/repository/posts_repo.dart';



class GetPostsUseCase{

  PostsRepo postsRepo;

  GetPostsUseCase({required this.postsRepo});

  Future<List<PostsModel>> getPosts(int page){
    return postsRepo.getPostsRepo(page);
  }

}