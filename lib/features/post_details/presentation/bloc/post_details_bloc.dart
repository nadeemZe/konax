import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konax_posts/features/post_details/presentation/bloc/post_details_event.dart';
import 'package:konax_posts/features/post_details/presentation/bloc/post_details_state.dart';
import '../../../../core/error/exceptions.dart';
import '../../../posts/data/model/posts_model.dart';
import '../../domain/use_cases/get_post_details.dart';

class PostDetailsBloc extends Bloc<PostDetailsEvent,PostDetailsState>{
  final GetPostDetailsUseCase getPostDetailsUseCase;
  PostDetailsBloc({required this.getPostDetailsUseCase}):super(PostDetailsInit()) {

    on<PostDetailsEvent>((event, emit) async {
      if (event is GetPostDetailsEvent) {
        emit(PostDetailsLoading());
        try {
          PostsModel postsModel = await getPostDetailsUseCase.getPostDetails(event.id);
          emit(PostDetailsDone(postsModel: postsModel));
        }on ServerException{
          emit(PostsDetailsError());
        }
      }
    });
  }
}