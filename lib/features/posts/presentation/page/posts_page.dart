import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konax_posts/features/post_details/presentation/bloc/post_details_bloc.dart';
import 'package:konax_posts/features/post_details/presentation/bloc/post_details_event.dart';
import 'package:konax_posts/features/post_details/presentation/page/post_details_page.dart';
import 'package:konax_posts/features/posts/presentation/bloc/posts_bloc.dart';
import 'package:konax_posts/features/posts/presentation/bloc/posts_state.dart';
import '../../../../widget/error_widget.dart';
import '../../../../widget/loading_widget.dart';
import '../../data/model/posts_model.dart';
import '../bloc/posts_event.dart';

class PostsPage extends StatelessWidget{
   PostsPage({Key? key}) : super(key: key);

  final List<PostsModel> _posts=[];
  final ScrollController _scrollController=ScrollController();

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top:5,right: 12,left: 12),
        child: BlocBuilder<PostsBloc,PostsState>(
          builder: (context,state){
            if(state is PostsLoading){
              return const LoadingWidget();
            }
            else if(state is PostsError){
              return const ErrorsWidget(text: 'No internet');
            }
            else if(state is PostsDone){
              _posts.addAll(state.postsModel);
               return ListView.builder(
                   controller: _scrollController..addListener(() {
                      if(_scrollController.offset==_scrollController.position.maxScrollExtent){
                        BlocProvider.of<PostsBloc>(context).add(GetPostsEvent());
                      }
                    }),
                   scrollDirection: Axis.vertical,
                   itemCount: _posts.length,
                   itemBuilder:(context,index){
                     return InkWell(
                       onTap: (){
                         BlocProvider.of<PostDetailsBloc>(context)
                             .add(GetPostDetailsEvent(id:_posts[index].id ));
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const PostDetailsPage()));
                       },
                       child: Container(
                         height: 77,
                         padding: const EdgeInsets.all(7),
                         margin: const EdgeInsets.only(top: 7),
                         color: Colors.black12,
                         child: Text(
                           _posts[index].title,
                           style: const TextStyle(
                             color: Colors.blue,
                           ),
                         ),
                       ),
                     );
                   }
               );
            }
            else {
              return const ErrorsWidget(
                  text: 'Some error ',
              );
            }
          },
        ),
      ),
    );
  }
}