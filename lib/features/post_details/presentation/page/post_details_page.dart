import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widget/error_widget.dart';
import '../../../../widget/loading_widget.dart';
import '../../../comments/presentation/bloc/comments_bloc.dart';
import '../../../comments/presentation/bloc/comments_event.dart';
import '../../../comments/presentation/page/comments_page.dart';
import '../bloc/post_details_bloc.dart';
import '../bloc/post_details_state.dart';

class PostDetailsPage extends StatelessWidget{
  const PostDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 51,right: 12,left: 12),
        child: BlocBuilder<PostDetailsBloc,PostDetailsState>(
          builder: (context,state){
            if(state is PostDetailsLoading){
              return const LoadingWidget();
            }
            else if(state is PostsDetailsError){
              return const ErrorsWidget(text: 'No internet');
            }
            else if(state is PostDetailsDone){
              return Column(
                      children: [
                       Text(
                        state.postsModel.title,
                        style: const TextStyle(
                         color: Colors.blue,
                         fontWeight: FontWeight.bold
                        ),
                      ),
                        const SizedBox(height: 7,),
                        Container(
                          padding: const EdgeInsets.all(7),
                          margin: const EdgeInsets.only(top: 7),
                          color: Colors.black12,
                          child: Text(
                            state.postsModel.body,
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(height: 51,),
                        ElevatedButton(
                            onPressed: (){
                              BlocProvider.of<CommentsBloc>(context)
                                  .add(GetCommentsEvent(id:state.postsModel.id ));
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CommentsPage()));
                            },
                            child: const Text(
                              'comments',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                        )
                ],
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