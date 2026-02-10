// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/bloc/cart/cart_bloc.dart';
import 'package:foods_app/controller/payment_controller.dart';
import 'package:foods_app/view/filter_products.dart';
import 'package:foods_app/view/nav_bar.dart';
import 'package:foods_app/view/register.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Payment extends StatefulWidget {
  Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Paymentcon paymentcon = Paymentcon();
  String selectedPayment = "";

  @override
  Widget build(BuildContext context) {
    final cartItems = context.read<CartBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      // body: Text(
      //   "Total :\$${paymentcon.AfterDiscount(cartItems.state.foodlist).toStringAsFixed(2)}",
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            InkWell(
              onTap: () {
                setState(() {
                  selectedPayment = "ACELEDA";      
                });
              },
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.2,
                  ),
                ),
                child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/image/ac.png"),
                      ),
                      SizedBox(width: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ACELEDA ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                          Text("097 97 97 971", )
                        ],
                      ),
                     Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 2, color:Colors.red)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: (selectedPayment=="ACELEDA")? Colors.red:Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: () {
                setState(() {
                  selectedPayment = "ABA";      
                });
              },
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.2,
                  ),
                ),
                child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/image/aba.png"),
                      ),
                      SizedBox(width: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ABA ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                          Text("0001 43575 245", )
                        ],
                      ),
                     Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 2, color:Colors.red)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: (selectedPayment=="ABA")? Colors.red:Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: () {
                setState(() {
                  selectedPayment = "delivery";      
                });
              },
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.2,
                  ),
                ),
                child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/image/delivery.png"),
                      ),
                      SizedBox(width: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Delivery", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                          Text("088 888 88 88", )
                        ],
                      ),
                     Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 2, color:Colors.red)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: (selectedPayment=="delivery")? Colors.red:Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: () {
                setState(() {
                  selectedPayment = "other";      
                });
              },
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.2,
                  ),
                ),
                child: Row(
                    children: [
                      SizedBox(width: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text("Bank Transfer", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                     Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 2, color:Colors.red)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: (selectedPayment=="other")? Colors.red:Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
              ),
            ),

            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Text("Total changes", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text("\$${paymentcon.AfterDiscount(cartItems.state.foodlist).toStringAsFixed(2)}",style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            SizedBox(height: 100,),
            InkWell(
              onTap: () {
                if(selectedPayment=="ABA" || selectedPayment=="ACELEDA" || selectedPayment=="other"){
                  showDialog(
                    context: context, 
                    builder: (context){
                      return AlertDialog(
                        title: Text("Scan Here 😘", style: TextStyle(fontSize: 20),),
                        backgroundColor: Colors.white,
                        content: Container(
                          width: 320,
                          height: 320,
                          child: Center(
                            child: QrImageView(
                              data: "This is simple QR code",
                              version: QrVersions.auto,
                              size: 320,
                              gapless: false,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 70,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color.fromARGB(255, 10, 58, 131)),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancle",
                                  style: TextStyle(color: Color.fromARGB(255, 10, 58, 131)),)
                                ),
                              ),
                              // Spacer(),
                              SizedBox(width: 5,),
                              Container(
                                width: 70,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: TextButton(
                                  onPressed: (){
                                    cartItems.state.foodlist.clear();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Success!'),
                                      backgroundColor: Colors.green,
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NavBars()));
                                  },
                                  child: InkWell(
                                    
                                    child: Text("Done", style: TextStyle(color: Colors.white),))
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    }
                  );
                }
                if(selectedPayment=="delivery"){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      content: Container(
                        width: 300,
                        height: 400,
                        decoration: BoxDecoration(
                          color: Colors.white
                        ),
                        child: Column(
                          children: [
                            Image.network("https://cdn.dribbble.com/userupload/22333996/file/original-6ac4030147adbe5d9381c4600c79eccb.gif", width: 250, height: 250, fit: BoxFit.cover,),
                            Text("Confirm Order", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                            Text("Thank you for Order", style: TextStyle(fontSize: 16),),
                            SizedBox(height: 20,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white
                              ),
                              onPressed: (){
                                cartItems.state.foodlist.clear();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> NavBars())); 
                              }, 
                              child: Text("Go Back"))
                          ],
                          
                        ),
                      ),
                    );
                   } 
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 90),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text("Continue", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
