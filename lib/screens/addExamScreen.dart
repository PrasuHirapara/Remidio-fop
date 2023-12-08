import 'package:flutter/material.dart';
import 'package:remidio_fop/constants/colors.dart';
import 'package:remidio_fop/constants/styles.dart';

class AddExam extends StatefulWidget {
  const AddExam({super.key});

  @override
  State<AddExam> createState() => _AddExamState();
}

class _AddExamState extends State<AddExam> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondaryColor,

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Add Exam', style: appTitleTheme,),
        centerTitle: true,
      ),

      body: Column(
        children: [

        ],
      ),
    );
  }
}
