



class PostsModel {

  int userId;
  int id;
  String title;
  String body;

  PostsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body
  });

  factory PostsModel.fromJson(Map<String,dynamic> json){
    return PostsModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']
    );
  }

}