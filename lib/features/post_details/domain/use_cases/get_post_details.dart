import 'package:konax_posts/features/posts/data/model/posts_model.dart';
import '../repository/post_details_repo.dart';




class GetPostDetailsUseCase{

  PostDetailsRepo postDetailsRepo;

  GetPostDetailsUseCase({required this.postDetailsRepo});

  Future<PostsModel> getPostDetails(int id){
    return postDetailsRepo.getPostDetailsRepo(id);
  }

}