import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../model/comments_model.dart';

abstract class CommentsRemoteSource{
  Future<List<CommentsModel>> getCommentsRemoteSource(int id);
}

class CommentsRemoteSourceImp implements CommentsRemoteSource{
  final Dio dio;
  CommentsRemoteSourceImp({required this.dio});

  @override
  Future<List<CommentsModel>> getCommentsRemoteSource(int id) async{
    List<CommentsModel> commentsList=[];
    try {
      Response response = await dio.get('https://jsonplaceholder.typicode.com/posts/$id/comments?_page=1&_limit=1');
      var data = (response.data)  ;
      for(int i=0;i<data.length;i++){
        CommentsModel commentsModel= CommentsModel.fromJson(data[i]);
        commentsList.add(commentsModel);
      }
      return commentsList;
    } on DioError {
      throw ServerException();
    }

  }

}