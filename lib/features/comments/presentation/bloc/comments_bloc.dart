import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konax_posts/core/error/exceptions.dart';
import '../../data/model/comments_model.dart';
import '../../domain/use_cases/get_comments.dart';
import 'comments_event.dart';
import 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent,CommentsState>{
  final GetCommentsUseCase getCommentsUseCase;
  CommentsBloc({required this.getCommentsUseCase}):super(CommentsInit()) {
    on<CommentsEvent>((event, emit) async {
      if (event is GetCommentsEvent) {
        emit(CommentsLoading());
        try {
          List<CommentsModel>commentsList = await getCommentsUseCase
              .getComments(event.id);
          emit(CommentsDone(commentsModel: commentsList));
        }on ServerException{
          emit(CommentsError());
        }
      }
    });
  }
}