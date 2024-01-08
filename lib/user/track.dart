// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';


class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  int _currentIndex=0;
  final PageController _pageController=PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Stepper Sample')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  StepperComponent(
                    CurrentIndex: _currentIndex,
                  index: 0, onTap: () {  
                    setState(() {
                      _currentIndex=0;
                    });
                  },),
                   StepperComponent(
                    CurrentIndex: _currentIndex,
                  index: 1, onTap: () {  setState(() {
                      _currentIndex=1;
                    }); },),
                   StepperComponent(
                    CurrentIndex: _currentIndex,
                  index: 2, onTap: () {  setState(() {
                      _currentIndex=2;
                    }); },),
                   StepperComponent(
                    CurrentIndex: _currentIndex,
                  index: 3, onTap: () {  setState(() {
                      _currentIndex=3;
                    }); },),
                 
                ],
              ),
            ),
          Expanded(child: PageView.builder(
            controller: _pageController,
            itemCount: 4,
            itemBuilder: (context, index){

            return Center(
              child: Text('Page $index'),
            );
          }))
          ],
        ),
      ),
    );
  }
}

class StepperComponent extends StatelessWidget {
  int index;
  int CurrentIndex;
  VoidCallback onTap;
  StepperComponent({
    super.key,
     required this.CurrentIndex,
     required this.index,
     required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:index==CurrentIndex ? Colors.orange:Colors.transparent,
                    border: Border.all(color: Colors.orange)
                  ),
                ),
              ),
              Expanded(child: Container(
                height: 2,
                  color:CurrentIndex==index+1 ? Colors.orange:Colors.black12,
              )),
            ],
          ),
          Text('page: ${index+1}')
        ],
      ),
    );
  }
}

