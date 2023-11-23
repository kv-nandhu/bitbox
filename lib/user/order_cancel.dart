// ignore: file_names
import 'package:bitebox/user/cart.dart';
import 'package:bitebox/main.dart';
import 'package:bitebox/user/order_detail.dart';
import 'package:bitebox/user/rec_detailScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderCancel extends StatefulWidget {
  const OrderCancel({super.key});

  @override
  State<OrderCancel> createState() => _OrderCancelState();
}

class _OrderCancelState extends State<OrderCancel> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.shade700,
        title: Text("Cancel Order"),
        centerTitle: true,
        actions: [
          Icon(Icons.arrow_back)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text("Please select reason for cancellation:"),
              SizedBox(height: 20,),
              Divider(color: Colors.black,),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(8),
                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      
                                      Radio(
                                          value: "radio value",
                                          groupValue: "group value",
                                          onChanged: (value) {
                                            print(value); //selected value
                                          }),
                                      Text(
                                        "Waiting for long time",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                        
                                    ],
                                  ),
                                  ),
                ],
              ),
               Row(
                children: [
                  Padding(padding: EdgeInsets.all(8),
                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      
                                      Radio(
                                          value: "radio value",
                                          groupValue: "group value",
                                          onChanged: (value) {
                                            print(value); //selected value
                                          }),
                                      Text(
                                        "Unable with contact with driver",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                        
                                    ],
                                  ),
                                  ),
                ],
              ),
               Row(
                children: [
                  Padding(padding: EdgeInsets.all(8),
                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      
                                      Radio(
                                          value: "radio value",
                                          groupValue: "group value",
                                          onChanged: (value) {
                                            print(value); //selected value
                                          }),
                                      Text(
                                        "Wrong address shown",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                        
                                    ],
                                  ),
                                  ),
                ],
              ),
               Row(
                children: [
                  Padding(padding: EdgeInsets.all(8),
                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      
                                      Radio(
                                          value: "radio value",
                                          groupValue: "group value",
                                          onChanged: (value) {
                                            print(value); //selected value
                                          }),
                                      Text(
                                        "I want to order something else",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                        
                                    ],
                                  ),
                                  ),
                ],
              ),
               Row(
                children: [
                  Padding(padding: EdgeInsets.all(8),
                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      
                                      Radio(
                                          value: "radio value",
                                          groupValue: "group value",
                                          onChanged: (value) {
                                            print(value); //selected value
                                          }),
                                      Text(
                                        "I just want to cancel",
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                        
                                    ],
                                  ),
                                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(15),
                  child: Text("Other reason"),
                  )
                 
                ],
              ),
           Container(
            padding: EdgeInsets.all(20),
             child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Description here....'
              ),
              keyboardType: TextInputType.multiline,
              minLines: 1, 
              maxLines: 5, 

                   ),
           ),
           SizedBox(height: 40,),
      
               Padding(
                    padding: EdgeInsets.all(10),
                    // ignore: sized_box_for_whitespace
                    child: Container(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                         OrderCancel(context);
                        },
                        style: ElevatedButton.styleFrom(
                          // ignore: deprecated_member_use
                          primary: Colors.redAccent.shade700,
                        ),
                        child: Text(
                          'Submit here',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),),
      )    );
  }
  void OrderCancel(BuildContext context){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Cancellation'),
        content:Text('Product Cancellation'),
        actions: [
          ElevatedButton(onPressed: (){
            Cancellation(context);
          }, child: Text('YES')),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          },
           child: Text('NO')),
      ]);
    });
  }
   void Cancellation(BuildContext ctx)async{
   Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (ctx)=> CancelDetails()));
 final _shared =await SharedPreferences.getInstance();
 _shared.setBool(SAVE_KEY, false);
  }
}

