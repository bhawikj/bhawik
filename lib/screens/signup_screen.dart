// import 'package:bhawik/models/user.dart';
import 'package:bhawik/viewmodels/signup_view_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bhawik/utilities/constants.dart';
import 'package:bhawik/screens/login_screen.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<SignupScreen> {
  bool _rememberMe = false;
  // User user = User();

  TextEditingController nameInpCont = new TextEditingController();
  TextEditingController emailInpCont = new TextEditingController();
  TextEditingController passInpCont = new TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: nameInpCont,
            validator: (String val) {
              if (val.isEmpty) {
                return "Name is required";
              }
              return null;
            },
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Color(0xFFFFFFFF)),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              hintText: 'Enter your Name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

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
            validator: (String val) {
              if (val.isEmpty) {
                return "Email is required";
              }
              if (!EmailValidator.validate(val)) {
                return "Enter a valid email";
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            controller: emailInpCont,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            validator: (String val) {
              if (val.isEmpty) {
                return "Password cannot be empty";
              }
              return null;
            },
            controller: passInpCont,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignupBtn(SignUpViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'SIGN UP',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
        onPressed: () async {
          if (_formkey.currentState.validate()) {
            model.signUp(
                email: emailInpCont.text,
                password: passInpCont.text,
                fullName: nameInpCont.text);
          } else {
            debugPrint("Error\nerror");
          }

          // String uid = await Auth().signUp(
          //     User(fullName: nameInpCont.text, email: emailInpCont.text),
          //     passInpCont.text);
        },
      ),
    );
  }

  /*Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }*/

  /*Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Facebook'),
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
        ],
      ),
    );
  }*/

  Widget _buildloginBtn() {
    return GestureDetector(
      onTap: () {
        debugPrint('Login clicked');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Login',
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
    return ViewModelProvider<SignUpViewModel>.withConsumer(
      viewModel: SignUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
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
                        Color(0xFF3594DD),
                        Color(0xFF4563DB),
                        Color(0xFF5036D5),
                        Color(0xFF5B16D0),
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
                        vertical: 90.0,
                      ),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'OpenSans',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            _buildNameTF(),
                            SizedBox(
                              height: 20.0,
                            ),
                            _buildEmailTF(),
                            SizedBox(
                              height: 20.0,
                            ),
                            _buildPasswordTF(),
                            _buildSignupBtn(model),
                            /*_buildSignInWithText(),
                      _buildSocialBtnRow(),*/
                            _buildloginBtn(),
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget build(BuildContext context) {
//   return Scaffold(
//     body: AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.light,
//       child: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Stack(
//           children: <Widget>[
//             Container(
//               height: double.infinity,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color(0xFF3594DD),
//                     Color(0xFF4563DB),
//                     Color(0xFF5036D5),
//                     Color(0xFF5B16D0),
//                   ],
//                   stops: [0.1, 0.4, 0.7, 0.9],
//                 ),
//               ),
//             ),
//             Container(
//               height: double.infinity,
//               child: SingleChildScrollView(
//                 physics: AlwaysScrollableScrollPhysics(),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 40.0,
//                   vertical: 90.0,
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'OpenSans',
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 30.0),
//                     _buildNameTF(),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     _buildEmailTF(),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     _buildPasswordTF(),
//                     _buildSignupBtn(),
//                     /*_buildSignInWithText(),
//                     _buildSocialBtnRow(),*/
//                     _buildloginBtn(),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
