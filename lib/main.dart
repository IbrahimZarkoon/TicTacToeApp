import 'package:flutter/material.dart';
import 'package:tictactoe/src/base/splash_screen.dart';

void main() {
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget{
  const TicTacToe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp( //use MaterialApp() widget like this
        home: SplashScr(),
        debugShowCheckedModeBanner: false,//create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}

