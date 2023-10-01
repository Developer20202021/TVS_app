

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:tvs_app/Screens/AdminScreen/HomeScreen.dart';
import 'package:tvs_app/Screens/CommonScreen/RegistrationScreen.dart';
import 'package:tvs_app/Screens/CommonScreen/StaffScreen.dart';



class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController myEmailController = TextEditingController();
  TextEditingController myPassController = TextEditingController();



   var createUserErrorCode = "";

   bool loading = false;



  @override
  Widget build(BuildContext context) {

    FocusNode myFocusNode = new FocusNode();
 

    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        automaticallyImplyLeading: false,
        title: const Text("Log In",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        
      ),
      body: SingleChildScrollView(

        child: loading?Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                      child: LoadingAnimationWidget.discreteCircle(
                        color: const Color(0xFF1A1A3F),
                        secondRingColor: Theme.of(context).primaryColor,
                        thirdRingColor: Colors.white,
                        size: 100,
                      ),
                    ),
              ): Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [





               createUserErrorCode=="wrong-password"? Center(
                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
              
              
                                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.close, color: Colors.red,),
                    Text("Wrong password provided for that user."),
                  ],
                ),
                                ),
                 
                             decoration: BoxDecoration(
                              color: Colors.red[100],
              
                              border: Border.all(
                      width: 2,
                      color: Colors.white

                      
                    ),
                              borderRadius: BorderRadius.circular(10)      
                             ),)),
              ):Text(""),







              createUserErrorCode=="user-not-found"? Center(
                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
              
              
                                child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  children: [
                    Icon(Icons.close, color: Colors.red,),
                    Text("No user found for that email.", overflow: TextOverflow.clip,),
                  ],
                ),
                                ),
                 
                             decoration: BoxDecoration(
                              color: Colors.red[100],
              
                              border: Border.all(
                      width: 2,
                      color: Colors.white

                      
                    ),
                              borderRadius: BorderRadius.circular(10)      
                             ),)),
              ):Text(""),








              




            
              
              // Center(
              //   child: Lottie.asset(
              //   'lib/images/animation_lk8fkoa8.json',
              //     fit: BoxFit.cover,
              //     width: 200,
              //     height: 200
              //   ),
              // ),
            
            // SizedBox(
            //           height: 20,
            //         ),
            
            
            
              TextField(
                
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Email',
                     labelStyle: TextStyle(
        color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
            ),
                    hintText: 'Enter Your Email',
            
                    //  enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                    //     ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                        ),
                    
                    
                    ),
                controller: myEmailController,
              ),
            
            
            
            
              SizedBox(
                height: 20,
              ),
            
            
            
            
            
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Password',
                     labelStyle: TextStyle(
        color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
            ),
                    hintText: 'Enter Your Password',
                    //  enabledBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                    //   ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Theme.of(context).primaryColor),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                      ),
                    
                    
                    ),
                controller: myPassController,
              ),
            
              SizedBox(
                height: 10,
              ),
            
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 150, child:TextButton(onPressed: () async{


                    setState(() {
                      loading = true;
                    });

                    try {
                      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: myEmailController.text.trim(),
                        password: myPassController.text.trim()
                      );

                      var userName = credential.user!.displayName;
                      var userEmail = credential.user!.email;
                      var userVerified = credential.user!.emailVerified;


                      if (userVerified) {


                        List  AllData = [];


                    CollectionReference _collectionRef =
                      FirebaseFirestore.instance.collection('admin');

                      Query query = _collectionRef.where("userEmail", isEqualTo: myEmailController.text);
                    QuerySnapshot querySnapshot = await query.get();

                
                      // Get docs from collection reference
                     

                      // Get data from docs and convert map to List
                      AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
                      setState(() {
                        
                        AllData = querySnapshot.docs.map((doc) => doc.data()).toList();
                      });





                      print(AllData);
            


               



                  if (AllData[0]["AdminApprove"] == "true") {

                    setState(() {
                          loading=false;
                        });


                           Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(userName: userName, userEmail: userEmail, indexNumber: "1")),);

                    
                  }

                  else{

                    setState(() {
                          loading=false;
                        });


                Navigator.push(context, MaterialPageRoute(builder: (context) => StaffScreen()),);


                  }



                        











                       









                        

                        
                      }
                      else{


                          await credential.user?.delete();

                             CollectionReference _collectionRef =
                      FirebaseFirestore.instance.collection('admin');
                          _collectionRef.doc(userEmail).delete().then(
      (doc) => print("Document deleted"),
      onError: (e) => print("Error updating document $e"),
    );

                            setState(() {
                          loading=false;
                        });
                        
                           Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()),);


                      }




                



                      
                  






                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {

                        setState(() {
                          loading=false;
                          createUserErrorCode = "user-not-found";
                          
                        });
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {


                        setState(() {
                          loading=false;
                          createUserErrorCode = "wrong-password";
                          
                        });
                        print('Wrong password provided for that user.');
                      }
                    }







                  }, child: Text("Log in", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                   
          backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
        ),),),



              Container(width: 150, child:TextButton(onPressed: (){

                     Navigator.push(
                  context,

             MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                );




              }, child: Text("Create Account", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                   
          backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
        ),),),





                ],
              )
            
            
            
            ],
          ),
        ),
        ),
      
      
    );
  }
}



class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xff8f00ff);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
