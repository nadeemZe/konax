import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konax_posts/features/comments/presentation/bloc/comments_bloc.dart';
import 'package:konax_posts/features/post_details/presentation/bloc/post_details_bloc.dart';
import 'package:konax_posts/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:konax_posts/features/posts/presentation/bloc/posts_event.dart';
import 'package:konax_posts/features/posts/presentation/page/posts_page.dart';

import 'di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
           providers: [
             BlocProvider(
               create:  (_)=>getIt<PostsBloc>()..add(GetPostsEvent())),
             BlocProvider(
               create: (_)=>getIt<PostDetailsBloc>(),),
             BlocProvider(
               create: (_)=>getIt<CommentsBloc>(),)
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Konax posts',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
           home: PostsPage(),
         ),
    );
  }
}