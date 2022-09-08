import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:konax_posts/features/comments/data/data_sources/comments_remote_source.dart';
import 'package:konax_posts/features/comments/data/repository/comments_repo_imp.dart';
import 'package:konax_posts/features/comments/domain/repository/comments_repo.dart';
import 'package:konax_posts/features/comments/domain/use_cases/get_comments.dart';
import 'package:konax_posts/features/comments/presentation/bloc/comments_bloc.dart';
import 'package:konax_posts/features/post_details/data/data_sources/post_details_remote_source.dart';
import 'package:konax_posts/features/post_details/data/repository/post_details_repo_imp.dart';
import 'package:konax_posts/features/post_details/domain/repository/post_details_repo.dart';
import 'package:konax_posts/features/post_details/domain/use_cases/get_post_details.dart';
import 'package:konax_posts/features/post_details/presentation/bloc/post_details_bloc.dart';
import 'package:konax_posts/features/posts/data/data_sources/posts_remote_source.dart';
import 'package:konax_posts/features/posts/data/repository/posts_repo_imp.dart';
import 'package:konax_posts/features/posts/domain/repository/posts_repo.dart';
import 'package:konax_posts/features/posts/domain/use_cases/get_posts.dart';
import 'package:konax_posts/features/posts/presentation/bloc/posts_bloc.dart';
import 'core/external/network_checker.dart';



final getIt=GetIt.instance;

void setUp(){

  //bloc
  getIt.registerFactory(() =>PostsBloc(getPostsUseCase: getIt()) );
  getIt.registerFactory(() => PostDetailsBloc(getPostDetailsUseCase: getIt()));
  getIt.registerFactory(() => CommentsBloc(getCommentsUseCase: getIt()));
  
  //Usecase
  getIt.registerLazySingleton(() => GetPostsUseCase(postsRepo: getIt()));
  getIt.registerLazySingleton(() => GetPostDetailsUseCase(postDetailsRepo: getIt()));
  getIt.registerLazySingleton(() => GetCommentsUseCase(commentsRepo: getIt()));
  
  //Repo
  getIt.registerLazySingleton<PostsRepo>(() => PostsRepoImp(postsRemoteSource: getIt(), networkChecker: getIt()));
  getIt.registerLazySingleton<PostDetailsRepo>(() => PostDetailsRepoImp(postDetailsRemoteSource: getIt(), networkChecker: getIt()));
  getIt.registerLazySingleton<CommentsRepo>(() => CommentsRepoImp(commentsRemoteSource: getIt(), networkChecker: getIt()));
  
  //Data source
  getIt.registerLazySingleton<PostsRemoteSource>(() => PostsRemoteSourceImp(dio: getIt()));
  getIt.registerLazySingleton<PostDetailsRemoteSource>(() => PostDetailsRemoteSourceImp(dio: getIt()));
  getIt.registerLazySingleton<CommentsRemoteSource>(() => CommentsRemoteSourceImp(dio: getIt()));

  //External
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton<NetworkChecker>(() => NetworkCheckerImpl(internetConnectionChecker: getIt()));
  getIt.registerLazySingleton(() => InternetConnectionChecker());

}
