import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key});
  @override
  State<StatefulWidget> createState(){
    return _QuestionsScreenState();
  }

}

class _QuestionsScreenState extends State<QuestionsScreen>{
  @override
  Widget build(BuildContext context) {
  return Center(
    child: Text('Questions Screen', style: TextStyle(fontSize: 30, color: Colors.white),
    ),
  );
  }
}