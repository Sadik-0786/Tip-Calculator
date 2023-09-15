import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tip_calculator/splase_screen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

 return MaterialApp(
   title: 'Tip Calculator',
   debugShowCheckedModeBanner: false,
   theme: ThemeData(
     fontFamily:'Ubuntu',
   ),
   home: SplaceScreen(),
 );
  }

}
class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var mainColor = Color(0xff01C9BE);

  var bgColor = Color(0xffF5F3F4);
  var amtController=TextEditingController();
  var customTipController=TextEditingController();
  var billAmt=0.0;
  var tipPercent=0.0;
  var tipAmt=0.0;
  var noOfPerson=1;
  var totalBill=0.0;
  var perPersonAmt=0.0;
   bool isCustomTip=false;
   bool colorChange10=true;
  bool colorChange15=true;
  bool colorChange20=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
        color: bgColor,
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                myHeading(),
                SizedBox(
                  height: 15,
                ),
                myTotal(),
                SizedBox(
                  height: 15,
                ),
                myBill(),
                SizedBox(
                  height: 15,
                ),
                myTip(),
                SizedBox(
                  height: 15,
                ),
                billSpliter(),
                SizedBox(
                  height: 28,
                ),

              ],
            ),
          ),
        ),
          ),
      ),
    );
  }

  Widget myHeading() {
    return Expanded(
          flex: 2,
          child:
          Container(
            color: bgColor,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Image.asset('assites/image/Screenshot 2023-05-26 095828.png',height: 55,width: 55,),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Text('Mr ',style: TextStyle(
                   fontSize: 15,
                   fontWeight: FontWeight.w300
               ),),
                       Text('TIP',style: TextStyle(
                         fontSize: 30,
                         fontWeight: FontWeight.bold
                       ),),
                     ],
                   ),
                   Text('Calculater',style:TextStyle(
                       fontSize:20 ,
                       fontWeight: FontWeight.w300
                   ),),
                 ],
               )
             ],
           ),
          )

    );
  }

  Widget myTotal() {
    return Expanded(
        flex: 5,
        child:
        Container(
          width: double.infinity,
          color: bgColor,
          child:Card(
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(21.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                children: [
                  Text("Total p/person",style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300
              ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("\$",style: TextStyle(fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
                      Text(perPersonAmt==0.0?"000":perPersonAmt.toStringAsFixed(2),style: TextStyle(
                        fontSize: 37,
                        fontWeight: FontWeight.bold,
                      ),)
                    ],
                  ),
                  Divider(
                   thickness: 1,
                    color: Colors.grey.shade400,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Total bill',style: TextStyle(
                          fontSize: 18
                  ),),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('\$',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),),
                              Text(totalBill==0.0?"000":totalBill.toStringAsFixed(2),style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                color: mainColor,
                              ),)
                            ],
                          )

                        ],
                      ),
                      Column(
                        children: [
                          Text('Total tip',style: TextStyle(
                              fontSize: 18
                          ),),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('\$',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: mainColor,
                              ),),
                              Text(tipAmt==0.0?"000":tipAmt.toStringAsFixed(2),style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: mainColor,
                              ),)
                            ],
                          )

                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ) ,
        )
    );
  }

  Widget myBill() {
    return Expanded(
        flex: 2,
        child:
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: Container(
            color: bgColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Enter',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text('your bill'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 7,
                   child: Container(
                     height: 50,
                     decoration: BoxDecoration(
                     color: Colors.white,
                       borderRadius: BorderRadius.all(Radius.circular(20))
                     ),
                     child: TextField(
                       controller: amtController,
                       onChanged: (valu){

                         updateTipBorad();
                         setState(() {

                         });
                       },

                      keyboardType: TextInputType.number,
                       cursorColor: Colors.black,
                      decoration:InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        hintText: 'Amount..',
                       prefixIcon: Icon( Icons.attach_money,color: mainColor,),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: mainColor),
                          borderRadius: BorderRadius.circular(20),

                        )

                      ) ,
                ),
                   ),
                 )
              ],
            ),
          ),
        )
    );
  }

  Widget myTip()  {
    return Expanded(
        flex: 3,
        child:
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: Container(
            color: bgColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Choose',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Text('your tip'),
                    ],
                  ),
                ),
               Expanded(
                 flex: 7,
                 child: Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                         children: [
                           ConstrainedBox(

                             constraints: BoxConstraints.tightFor(
                               height: 50,

                             ),
                             child: ElevatedButton(onPressed: (){
                                 tipPercent=0.1;
                                 isCustomTip=false;
                                 customTipController.clear();
                                 colorChange20=true;
                                 colorChange10=false;
                                 colorChange15=true;
                                updateTipBorad();
                                 setState(() {

                                 });
                             }, child: Row(
                               children: [
                                 Text('10',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 23) ,),
                                 Text('%'),
                               ],
                             ),
                               style: ElevatedButton.styleFrom(

                                   backgroundColor: colorChange10==false?Colors.redAccent:mainColor,
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                             ),
                             ),
                           ),
                           ConstrainedBox(

                             constraints: BoxConstraints.tightFor(
                               height: 50,

                             ),
                             child: ElevatedButton(onPressed: (){
                               tipPercent=0.15;
                               isCustomTip=false;
                               colorChange20=true;
                               colorChange10=true;
                               colorChange15=false;
                               customTipController.clear();
                               updateTipBorad();
                               setState(() {

                               });
                             }, child: Row(
                               children: [
                                 Text('15',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 23) ,),
                                 Text('%'),
                               ],
                             ),
                               style: ElevatedButton.styleFrom(
                                   backgroundColor: colorChange15==false?Colors.redAccent:mainColor,
                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
                               ),
                             ),
                           ),
                           ConstrainedBox(

                             constraints: BoxConstraints.tightFor(
                               height: 50,

                             ),
                             child: ElevatedButton(onPressed: (){
                               tipPercent=0.2;
                               isCustomTip=false;
                               customTipController.clear();
                               colorChange20=false;
                               colorChange10=true;
                               colorChange15=true;
                               updateTipBorad();
                               setState(() {

                               });

                             }, child: Row(
                               children: [
                                 Text('20',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 23) ,),
                                 Text('%'),
                               ],
                             ),
                               style:ElevatedButton.styleFrom(
                                 backgroundColor: colorChange20==false?Colors.redAccent:mainColor,
                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                               ),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(
                         height: 20,
                       ),
                       ConstrainedBox(

                         constraints: BoxConstraints.tightFor(
                           height: 50,

                         ),
                         child: Stack(
                           children:[

                             Container(
                               height: 50,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(20)
                               ),
                               child: TextField(
                                 controller: customTipController,
                               onChanged: (valu){
                        colorChange15=true;colorChange10=true;colorChange20=true;
                      valu.isEmpty?tipPercent=0.0:tipPercent=double.parse(valu)/100;
                       updateTipBorad();
                       setState(() {

                       });
                       },

                         keyboardType: TextInputType.number,
                         decoration:InputDecoration(
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(20))
                           ),
                           hintText: 'Add Tip..',
                           prefixIcon: Icon( Icons.percent_outlined,color: mainColor,),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: mainColor),
                             borderRadius: BorderRadius.circular(20),

                           ),

                         ) ,
                       ),
                             ),

                            Visibility(
                              visible: !isCustomTip,
                              child: ConstrainedBox(

                                constraints: BoxConstraints.tightFor(height: 50),
                                child: ElevatedButton(

                                  onPressed: (){
                             isCustomTip=true;
                             setState(() {

                             });
                           },

                                  child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text('Custom tip',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 23) ,),

                                 ],
                           ),
                                 style: ElevatedButton.styleFrom(
                                     primary: mainColor,
                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)
                                     )
                                     )
                                 ),
                           ),
                              ),
                            ),
                   ]
                         ),
                       ),
                     ],
                   ),
                 ),
               )
              ],
            ),
          ),
        )
    );
  }

  Widget billSpliter() {
    return Expanded(
        flex: 2,
        child:
        Container(
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              color: bgColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Split',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Text('the total'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 14,
                    child: Container(

                      child:Row(
                        children:[

                      Expanded(
                        flex: 3,
                        child: InkWell(
                          onTap: (){

                            updateTipBorad();
                            setState(() {

                            });
                            if(noOfPerson>1)
                              noOfPerson--;
                            updateTipBorad();
                          },
                          child: Container(
                          height: 55,
                          width: 60,
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: Center(
                            child: Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                    ),
                        ),
                      ),
                    Expanded(
                      flex: 6,
                      child: InkWell(
                        onTap: (){
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 55,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                             noOfPerson.toString(),
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: (){

                          setState(() {

                          });
                          noOfPerson++;
                          updateTipBorad();
                        },
                        child: Container(
                          height: 55,
                          width: 60,
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
    ]
                    ),
                    ),
                  )],
              ),
            ),
          ),
        )
    );
  }
  void updateTipBorad(){
    billAmt=amtController.text.toString().isNotEmpty?double.parse(amtController.text.toString()):0.0;
    tipAmt=billAmt*tipPercent;
    totalBill=tipAmt+billAmt;
    perPersonAmt=totalBill/noOfPerson;
  }
}