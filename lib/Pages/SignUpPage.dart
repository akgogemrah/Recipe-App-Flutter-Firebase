import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_work/Model/UserModel.dart';
import 'package:recipe_app_work/Pages/AfterLoginPage.dart';
import '../Services/AuthService.dart';
import 'SignInPage.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
TextEditingController NameController=TextEditingController();
TextEditingController passwordController=TextEditingController();
TextEditingController passwordConfirmController=TextEditingController();
class _SignUpPageState extends State<SignUpPage> {
  bool isChecked=false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Text("Create an account",
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
            ),
            Text("Lets help you to create an account,",style: TextStyle(fontSize: 16,color: Colors.black)),
            Text(("It won't take long."),style: TextStyle(color: Colors.black,fontSize: 16),),
            SizedBox(height: 20,),
            Text("Name"),
            TextField(
              controller: NameController,
              onSubmitted: (value) {
                Provider.of<UserModel>(context,listen: false).Name=value;
                print(Provider.of<UserModel>(context,listen: false).Name);
                NameController.text=value;
                print(NameController.text);
              },//Name TextField
              decoration:
              InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: 'Enter Name'
              ),

            ),
            SizedBox(height: 10),
            Text("Email"),
            TextField(  // EmailTextfield
              onSubmitted: (value) {
                Provider.of<UserModel>(context,listen: false).email=value;
                print(Provider.of<UserModel>(context,listen: false).email);
              },
              decoration:
              InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: 'Enter Email'
              ),

            ),
            SizedBox(height: 10),
            Text("Password"),
            TextField( // PasswordTextField
              controller: passwordController,
              obscureText: true,
              onSubmitted: (value) {
                Provider.of<UserModel>(context,listen: false).password=value;
                print(Provider.of<UserModel>(context,listen: false).password);
                passwordController.text=value;
                print(passwordController.text);
              },
              decoration:
              InputDecoration(

                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: 'Enter Password'
              ),
            ),
            SizedBox(height: 10),
            Text(" Confirm Password"),
            TextField( //password confirm TextField
              controller: passwordConfirmController,
              onSubmitted: (value) {


                print(Provider.of<UserModel>(context,listen: false).password);
                passwordConfirmController.text=value;
                print(passwordConfirmController.text);
              },

              obscureText: true,
              decoration:
              InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: 'Confirm Password'
              ),
            ),
      Row(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          Text("Accepts terms & Condition",style: TextStyle(color: Colors.orange),)
        ],
      ),
            Container(
              height: 70,
              decoration: BoxDecoration(
                shape:BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.teal,
              ),
              child: OutlinedButton(    //SignIn
                onPressed: ()async{
                 await Provider.of<Auth>(context,listen:false).createUserWithEmailAndPassword(
                      Provider.of<UserModel>(context,listen: false).email,
                      Provider.of<UserModel>(context,listen: false).password
                  );
                  print("Pasword onay "+passwordConfirmController.text);
                  passwordConfirmController.text==Provider.of<UserModel>(context,listen: false).password?print("Şifre Onaylandı"):print("Şifreler aynı değil");
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


                  child: IconButton(style: IconButton.styleFrom(
                      minimumSize: Size(90, 70),
                  ),
                    color: Colors.teal,
                    onPressed: ()async{
                   await Provider.of<Auth>(context,listen: false).signInWithGoogle();
                   Navigator.of(context).push(
                       MaterialPageRoute(builder: (context) =>AfterLogin()));
                    },
                      icon: FaIcon(
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
                  Text("Already a member?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                  TextButton(onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>SignPage()));
                  }, child: Text("Sign In",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
