import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                    image: AssetImage('assets/images/login.png'),
                    fit: BoxFit.cover,
                  )
              
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40, left: 20, right: 20),                       
                    child: TextField(
                      
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.08),
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none
                        )
                      ), 
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),                       
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.08),
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Transform.scale(
                            scale: 0.5,
                            child: Image.asset('assets/icons/eye.png')),
                        )
                      ),
                      
                    ),
                  ),
                  SizedBox(height: 45),
                  Container(
                    width: 315,
                    height: 52,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF5151C6),
                          const Color(0xFF888BF4),
                        ]
                      ),
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child: Text('SIGN IN', style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      )
                      ),
                    )
                  ),
                  SizedBox(height: 45),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Already have an account? ', style: TextStyle(
                          color: Colors.black,
                        )),
                        TextSpan(
                          text: 'Register here',
                          style: TextStyle(
                            color: Color(0xFF5555c9),
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegisterPage()),
                              );
                            },
                        ),
                      ],
                    )
                    
                  )
                ]                
              )
            ),
          )
        ],
      )
    );
  }
}