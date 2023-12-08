import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remidio_fop/constants/colors.dart';
import 'package:remidio_fop/constants/drawer.dart';
import 'package:remidio_fop/constants/styles.dart';
import 'package:remidio_fop/screens/addExamScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: appSecondaryColor,

      appBar: AppBar(
        title: Text("Exams", style: appTitleTheme),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddExam()));
              },
              icon: const Icon(Icons.add, size: 40,)
          )
        ],
      ),

      drawer: const customDrawer(),

      body: Column(

      ),
    );
  }
}
