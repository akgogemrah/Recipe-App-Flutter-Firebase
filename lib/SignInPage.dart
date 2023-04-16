import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe_app_work/SignUpPage.dart';
class SignPage extends StatelessWidget {
  const SignPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(alignment: Alignment.centerLeft,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            ),
            Text("Hello,",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),),
            Text("Welcome Back!",style: TextStyle(color: Colors.black,
                fontSize: 24)
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Text("Email"),
            TextField(
              decoration:
              InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                hintText: 'Enter Email'
              ),

            ),
            SizedBox(height: 10,),
            Text("Enter Password"),
            TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                hintText: 'Enter Password'
              ),
            ),
            TextButton(onPressed: (){}, child: Align(alignment: Alignment.centerLeft,
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.orange
                ),
              ),
            )),
            Container(
              height: 70,
              decoration: BoxDecoration(
                shape:BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.teal,
              ),
              child: OutlinedButton(
                  onPressed: (){
              },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 20)),
                      SizedBox(width: 30,),
                      Icon(Icons.arrow_forward_outlined,color: Colors.white,size: 25,)
                    ],
                  ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 50, child: Divider()
                  ),
                  SizedBox(height: 25),
                  Text("Or Sign in With",
                  style:TextStyle(
                    color: Colors.grey
                  )
                  ),
                  SizedBox(
                      width: 50, child: Divider()
                  ),
                ]
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]
                  ),

                  height:socialMediaButtonSize,
                  width: socialMediaButtonSize,


                  child: IconButton(style: IconButton.styleFrom(minimumSize: Size(90, 70)),color: Colors.teal,onPressed: (){}, icon: FaIcon(
                    color: Colors.red,
                    FontAwesomeIcons.squareGooglePlus,
                    size: socialmediaIconSize
                  ),),
                ),
                SizedBox(width: 35.0,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]
                  ),
                  height:socialMediaButtonSize,
                  width: socialMediaButtonSize,
                  child: IconButton(style: IconButton.styleFrom(minimumSize: Size(90, 70)),color: Colors.teal,onPressed: (){}, icon: FaIcon(
                    color: Colors.blue,
                    FontAwesomeIcons.squareFacebook,
                    size: socialmediaIconSize
                  ),),
                ),


              ],
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                  TextButton(onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>SignUpPage()));
                  }, child: Text("Sign up",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),))
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}

double socialMediaButtonSize=60.0;
double socialmediaIconSize=35.0;