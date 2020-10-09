
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:monenou_web/Screens/Products/EmailSignUp.dart';
import 'package:monenou_web/Screens/Products/phonelogin.dart';
import 'package:monenou_web/constant.dart';

class EmailLogIn extends StatefulWidget {
  @override

  _EmailLogInState createState() => _EmailLogInState();
}
final _formKey = GlobalKey<FormState>();
FirebaseAuth firebaseAuth = FirebaseAuth.instance;
// DatabaseReference dbRef = Firestore.instance.reference().child("Users");
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _EmailLogInState extends State<EmailLogIn> {



  
  bool _rememberMe = false;
  

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: emailController,

            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Entrer votre email',
              hintStyle: kHintTextStyle,
            ),

            // The validator receives the text that the user has entered.

            validator: (value) {
              if (value.isEmpty) {
                return 'Entrer votre email';
              }

              return null;
            },
          ),

          //  TextField(
          //   keyboardType: TextInputType.emailAddress,
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontFamily: 'OpenSans',
          //   ),
          //   decoration: InputDecoration(
          //     border: InputBorder.none,
          //     contentPadding: EdgeInsets.only(top: 14.0),
          //     prefixIcon: Icon(
          //       Icons.email,
          //       color: Colors.white,
          //     ),
          //     hintText: 'Enter your Email',
          //     hintStyle: kHintTextStyle,
          //   ),
          // ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mot de passe',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,

            controller: passwordController,

            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Entrer votre mot de passe',
              hintStyle: kHintTextStyle,
            ),
          

            // The validator receives the text that the user has entered.

            validator: (value) {
              if (value.isEmpty) {
                return 'Entrer votre mot de passe';
              }

              return null;
            },
          ),

          // TextField(
          //   obscureText: true,
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontFamily: 'OpenSans',
          //   ),
          //   decoration: InputDecoration(
          //     border: InputBorder.none,
          //     contentPadding: EdgeInsets.only(top: 14.0),
          //     prefixIcon: Icon(
          //       Icons.lock,
          //       color: Colors.white,
          //     ),
          //     hintText: 'Enter your Password',
          //     hintStyle: kHintTextStyle,
          //   ),
          // ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Mot de passe oublié ?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Se souvenir de moi',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        // onPressed: () => print('Login Button Pressed'),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            logInToFb();
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Connecter',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

 

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () {
         Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => EmailSignUp(),
    ));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Pas encore inscrit ? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'S´inscrire',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
                          key: _formKey,

                      child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        //  background-image: linear-gradient(to bottom, #eaa651, #efa142, #f49c33, #fa9720, #ff9100);
                        Color(0xFFEAA651),
                        Color(0xFFEFA142),
                        Color(0xFFF49C33),
                        Color(0xFFFA9720),
                      ],
                      stops: [0.1, 0.4, 0.7, 0.9],
                    ),
                  ),
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 120.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Se connecter',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        _buildEmailTF(),
                        SizedBox(
                          height: 30.0,
                        ),
                        _buildPasswordTF(),
                        _buildForgotPasswordBtn(),
                        _buildRememberMeCheckbox(),
                        _buildLoginBtn(),
                        // _buildSignInWithText(),
                        // _buildSocialBtnRow(),
                        _buildSignupBtn(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }




  // @override
  // Widget build(BuildContext context) {

  //  return Scaffold(
  //    body:Form(
       
  //         key: _formKey,
  //         child: SingleChildScrollView(
  //             child: Column(children: <Widget>[
          
  //           Padding(
  //             padding: EdgeInsets.all(20.0),
  //             child: TextFormField(
  //               controller: emailController,

  //               decoration: InputDecoration(
  //                 labelText: "Enter Email",
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(10.0),
  //                 ),
  //               ),

  //               // The validator receives the text that the user has entered.

  //               validator: (value) {
  //                 if (value.isEmpty) {
  //                   return 'Enter email';
  //                 }

  //                 return null;
  //               },
  //             ),
  //           ),
            
  //           Padding(
  //             padding: EdgeInsets.all(20.0),
  //             child: TextFormField(
  //               keyboardType: TextInputType.visiblePassword,

  //               controller: passwordController,

  //               decoration: InputDecoration(
  //                 labelText: "Enter Password",
  //                 enabledBorder: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(10.0),
  //                 ),
  //               ),

  //               // The validator receives the text that the user has entered.

  //               validator: (value) {
  //                 if (value.isEmpty) {
  //                   return 'Enter password';
  //                 }

  //                 return null;
  //               },
  //             ),
  //           ),
  //           RaisedButton(
  //             color: Colors.lightBlue,
  //             onPressed: () {
  //               if (_formKey.currentState.validate()) {
  //                 logInToFb();
                  
  //               }
  //             },
  //             child: Text('Submit'),
  //           ),
  //         ])),



  //    )
  //  );
  // }

  void logInToFb() {
firebaseAuth
    .signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text)
    .then((result) {
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => PhoneVef(id:result.user.uid),
    ));
}).catchError((err) {
    print(err.message);
    showDialog(
        context: context,
        builder: (BuildContext context) {
        return AlertDialog(
            title: Text("Error"),
            content: Text(err.message),
            actions: [
            FlatButton(
                child: Text("Ok"),
                onPressed: () {
                Navigator.of(context).pop();
                },
            )
            ],
        );
        });
});
}

}