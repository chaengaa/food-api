import 'package:flutter/material.dart';
import 'package:foods_app/controller/logincon.dart';
import 'package:foods_app/view/splashscreen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("My Profile", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            ClipOval(
              child: Container(
                width: 160,
                height: 160,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(202, 61, 15, 15), width: 2),
                  borderRadius: BorderRadius.circular(100)
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/image/cat.png"),
                )),
            ),
            SizedBox(height: 20,),
            Text("FOOD APP", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text("Admin", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.edit, size: 25, color: Color.fromARGB(202, 61, 15, 15),),
                      SizedBox(width: 20,),
                      Text("Edit Profile", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      Spacer(),
                      Icon(Icons.chevron_right,size: 30, color: Color.fromARGB(202, 61, 15, 15),)
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Icon(Icons.notifications, size: 25, color: Color.fromARGB(202, 61, 15, 15),),
                      SizedBox(width: 20,),
                      Text("Notification", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      Spacer(),
                      Icon(Icons.chevron_right,size: 30, color: Color.fromARGB(202, 61, 15, 15),)
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 25, color: Color.fromARGB(202, 61, 15, 15),),
                      SizedBox(width: 20,),
                      Text("Location", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      Spacer(),
                      Icon(Icons.chevron_right,size: 30, color: Color.fromARGB(202, 61, 15, 15),)
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Icon(Icons.settings, size: 25, color: const Color.fromARGB(202, 61, 15, 15),),
                      SizedBox(width: 20,),
                      Text("Privacy Center", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                      Spacer(),
                      Icon(Icons.chevron_right,size: 30, color: Color.fromARGB(202, 61, 15, 15),)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                      onTap: () async{
                        await Savelogin.logout();
                        showDialog(
                    context: context, 
                    builder: (context){
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        content: Container(
                          height: 30,
                          child: Center(child: Text("Log Out of your account?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 70,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color.fromARGB(202, 61, 15, 15),),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: TextButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancle", style: TextStyle(color: Color.fromARGB(202, 61, 15, 15),fontWeight: FontWeight.w400),)
                                ),
                              ),
                              // Spacer(),
                              SizedBox(width: 5,),
                              Container(
                                width: 90,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(202, 61, 15, 15),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: TextButton(
                                  onPressed: (){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Splashscreen()));
                                  },
                                  child: Text("Log Out", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),)
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    }
                  );
                      },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(202, 61, 15, 15),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, color: Colors.white, size: 25,),
                      SizedBox(width: 10,),
                      Text("Log Out", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                    ],
                  )
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}