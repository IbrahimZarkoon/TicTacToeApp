import 'package:flutter/material.dart';
import 'package:tictactoe/src/base/home.dart';

class SplashScr extends StatefulWidget {
  const SplashScr({Key? key}) : super(key: key);

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {

  @override
  void initState() {
    super.initState();
    navigatetoHome();
  }

  navigatetoHome() async{
    await Future.delayed(const Duration(seconds: 2));

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) =>   const HomeScr()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:  [

                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(color: Color(0xFF0D47A1)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(padding: const EdgeInsets.only(top: 66),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                           Text("TIC TAC TOE",
                              style: TextStyle(color: Colors.white,fontSize: 35,
                                  fontWeight:FontWeight.bold ,fontFamily: 'Poppins' ),),
                          ],
                        ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/SS 1.png')

                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xFF42A5F5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/logo2.png')
                          ],

                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(bottom: 55),

                          child: Column(
                            children: const [
                              Text("POWERED BY ",
                                style: TextStyle(fontSize: 30, color: Colors.white),),
                            Text(" ZARKOON ",
                              style:
                              TextStyle(fontSize: 20, color: Color(0xFF0D47A1),
                              fontWeight: FontWeight.bold),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
                ]
          )
    );
  }
}

