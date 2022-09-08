import 'package:dio/dio.dart';
import 'package:konax_posts/features/posts/data/model/posts_model.dart';
import '../../../../core/error/exceptions.dart';



abstract class PostsRemoteSource{
  Future<List<PostsModel>> getPostsRemoteSource(int page);
}

class PostsRemoteSourceImp implements PostsRemoteSource{
  final Dio dio;
  PostsRemoteSourceImp({required this.dio});

  @override
  Future<List<PostsModel>> getPostsRemoteSource(int page) async{
   List<PostsModel> postsList=[];
   try {
     Response response = await dio.get('https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=10');
     var data = (response.data)  ;
     for(int i=0;i<data.length;i++){
       PostsModel postModel= PostsModel.fromJson(data[i]);
       postsList.add(postModel);
     }
     return postsList;
   } on DioError {
     throw ServerException();
   }


  }

}