import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widget/error_widget.dart';
import '../../../../widget/loading_widget.dart';
import '../bloc/comments_bloc.dart';
import '../bloc/comments_state.dart';

class CommentsPage extends StatelessWidget{
  const CommentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 7,right: 12,left: 12),
        child: BlocBuilder<CommentsBloc,CommentsState>(
          builder: (context,state){
            if(state is CommentsLoading){
              return const LoadingWidget();
            }
            else if(state is CommentsError){
              return const ErrorsWidget(text: 'No internet');
            }
            else if(state is CommentsDone){
              return ListView.builder(
                  itemCount: state.commentsModel.length,
                  itemBuilder:(context,index){
                    return Container(
                      padding: const EdgeInsets.all(7),
                      margin: const EdgeInsets.only(top: 7),
                      color: Colors.black12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.commentsModel[index].name,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 12,),
                          Text(
                            state.commentsModel[index].body,
                            style: const TextStyle(
                              color: Colors.blue,
                            ),
                          ),

                        ],
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