import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konax_posts/core/error/exceptions.dart';
import 'package:konax_posts/features/posts/data/model/posts_model.dart';
import 'package:konax_posts/features/posts/domain/use_cases/get_posts.dart';
import 'package:konax_posts/features/posts/presentation/bloc/posts_event.dart';
import 'package:konax_posts/features/posts/presentation/bloc/posts_state.dart';

class PostsBloc extends Bloc<PostsEvent,PostsState>{
  final GetPostsUseCase getPostsUseCase;
  PostsBloc({required this.getPostsUseCase}):super(PostsInit()) {

    int page=1;
    //bool isFetching=false;

    on<PostsEvent>((event, emit) async {
      if (event is GetPostsEvent) {
        emit(PostsLoading());
        try {
          List<PostsModel>postsList = await getPostsUseCase.getPosts(page);
          page++;
          emit(PostsDone(postsModel: postsList));
        }on ServerException{
          emit(PostsError());
        }
      }
    });
  }
}