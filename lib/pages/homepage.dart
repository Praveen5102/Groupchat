import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/back.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: 350, // Fixed top position
            left: 45, // Fixed left position
            child: SizedBox(
              width: 280, // Fixed width
              height: 60, // Fixed height
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF438E96), // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 28),
                  elevation: 0,
                ),
                onPressed: () {
                  // Navigate to signup page
                  Navigator.pushNamed(context, '/signup');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'lib/assets/icon.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Sign in with Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
