import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:tvs_app/Screens/AdminScreen/EditCustomerInfo.dart';
import 'package:tvs_app/Screens/AdminScreen/SearchByNID.dart';
import 'package:tvs_app/Screens/CommonScreen/LogInScreen.dart';


class CreateNewCustomer extends StatefulWidget {

  final String BikeName;
  final String BikeModelName;
  final String BikeColor;
  final String BikeSalePrice;



  const CreateNewCustomer({super.key, required this.BikeName, required this.BikeColor, required this.BikeModelName, required this.BikeSalePrice});

  @override
  State<CreateNewCustomer> createState() => _CreateNewCustomerState();
}

class _CreateNewCustomerState extends State<CreateNewCustomer> {
  TextEditingController customerPhoneNumberController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();
  TextEditingController customerNIDController = TextEditingController();

  bool loading = false;





  @override
  Widget build(BuildContext context) {

    FocusNode myFocusNode = new FocusNode();


 

    return  Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
           systemOverlayStyle: SystemUiOverlayStyle(
      // Navigation bar
      statusBarColor: Theme.of(context).primaryColor, // Status bar
    ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: Icon(Icons.chevron_left)),
        title: const Text("Create Customer Account", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
              ):Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            
                    
                 
            
            // SizedBox(
            //           height: 20,
            //         ),
            
            
            // enter your email 
            
                    TextField(
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Name',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
                  ),
                          hintText: 'Enter Customer Name',
            
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
                      controller: customerNameController,
                    ),
            
            
            
            
                    SizedBox(
                      height: 20,
                    ),
            
            
            
            
            
                    TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Address',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
                  ),
                          hintText: 'Enter Customer Address',
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
                      controller: customerAddressController,
                    ),
            
                    SizedBox(
                      height: 10,
                    ),



                    SizedBox(
                      height: 20,
                    ),
            
            
            
                    TextField(

                      keyboardType: TextInputType.phone,
                      
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer Phone Number',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
                  ),
                          hintText: 'Enter Customer Phone Number',
            
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
                      controller: customerPhoneNumberController,
                    ),
            
            
            
            
                    SizedBox(
                      height: 20,
                    ),
            
            
            
            
            
                    TextField(

                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Customer NID',
                           labelStyle: TextStyle(
              color: myFocusNode.hasFocus ? Theme.of(context).primaryColor: Colors.black
                  ),
                          hintText: 'Enter Customer NID',
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
                      controller: customerNIDController,
                    ),
            
                    SizedBox(
                      height: 10,
                    ),

                   


            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: 150, child:TextButton(onPressed: (){


                          setState(() {
                            loading = true;
                          });
                          
                    Future createCustomer(String CustomerName, CustomerNID, CustomerAddress, CustomerPhoneNumber) async{

                      final docUser = FirebaseFirestore.instance.collection("customer");

                      final jsonData ={
                        "CustomerName":CustomerName,
                        "CustomerNID":CustomerNID,
                        "CustomerAddress":CustomerAddress,
                        "CustomerPhoneNumber":CustomerPhoneNumber,
                        "BikeName":widget.BikeName,
                        "BikeColor":widget.BikeColor,
                        "BikeModelName":widget.BikeModelName,
                        "BikeSalePrice":widget.BikeSalePrice
                      };


                    await docUser.doc(CustomerNID).set(jsonData).then((value) =>               Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  EditCustomerInfo(CustomerNID: customerNIDController.text, CustomerAddress: customerAddressController.text, CustomerName: customerNameController.text, CustomerPhoneNumber: customerPhoneNumberController.text, BikeColor: widget.BikeColor,BikeModelName: widget.BikeModelName,BikeName: widget.BikeName,BikeSalePrice: widget.BikeSalePrice,)),
                      )).onError((error, stackTrace) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                              content: const Text('Something Wrong!'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            )));



                    }







                  



                  createCustomer(customerNameController.text.trim().toLowerCase(), customerNIDController.text.trim(), customerAddressController.text, customerPhoneNumberController.text.trim());




                      // Future.delayed(const Duration(milliseconds: 1500), () {

                      // // Here you can write your code

                      //   setState(() {
                      //           Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) =>  EditCustomerInfo(CustomerNID: customerNIDController.text, CustomerAddress: customerAddressController.text, CustomerName: customerNameController.text, CustomerPhoneNumber: customerPhoneNumberController.text, BikeColor: widget.BikeColor,BikeModelName: widget.BikeModelName,BikeName: widget.BikeName,BikeSalePrice: widget.BikeSalePrice,)),
                      // );
                      //   });

                      // });



                      setState(() {
                        loading = false;
                      });

                  

                        }, child: Text("Save", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                         
                backgroundColor: MaterialStatePropertyAll<Color>(Theme.of(context).primaryColor),
              ),),),



              SizedBox(width: 10,),


                 Container(width: 150, child:TextButton(onPressed: (){

                            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SearchByNID(BikeName: widget.BikeName, BikeColor:widget.BikeColor, BikeModelName: widget.BikeModelName, BikeSalePrice: widget.BikeSalePrice)),
                      );





                        }, child: Text("Previous Customer", style: TextStyle(color: Colors.white),), style: ButtonStyle(
                         
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
    paint.color = Colors.purple;
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






Future createCustomer(String CustomerName, CustomerNID, CustomerAddress, CustomerPhoneNumber) async{

  final docUser = FirebaseFirestore.instance.collection("customer");

  final jsonData ={
    "CustomerName":CustomerName,
    "CustomerNID":CustomerNID,
    "CustomerAddress":CustomerAddress,
    "CustomerPhoneNumber":CustomerPhoneNumber
  };


 await docUser.doc(CustomerNID).set(jsonData);



}





