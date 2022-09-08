import 'package:dio/dio.dart';
import 'package:konax_posts/features/posts/data/model/posts_model.dart';
import '../../../../core/error/exceptions.dart';



abstract class PostDetailsRemoteSource{
  Future<PostsModel> getPostDetailsRemoteSource(int id);
}

class PostDetailsRemoteSourceImp implements PostDetailsRemoteSource{
  final Dio dio;
  PostDetailsRemoteSourceImp({required this.dio});

  @override
  Future<PostsModel> getPostDetailsRemoteSource(int id) async{
    try {
      Response response = await dio.get('https://jsonplaceholder.typicode.com/posts/$id');
      var data = (response.data)  ;
        return  PostsModel.fromJson(data);

    } on DioError {
      throw ServerException();
    }


  }

}