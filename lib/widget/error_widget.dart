import 'package:flutter/material.dart';

class ErrorsWidget extends StatelessWidget{
  final String text;
  const ErrorsWidget({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.blue
          ),
        )
    );
  }
}