import 'package:flutter/material.dart';
import 'package:tictactoe/src/base/home.dart';

import 'leaderboard.dart';

class WinScr extends StatefulWidget {

   String winner = "";
   List<String> winners =[];


   WinScr(this.winner,this.winners,{super.key});

  @override
  State<WinScr> createState() => _WinScrState();
}

class _WinScrState extends State<WinScr> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      body: Container(
        padding: const EdgeInsets.only(left: 30,right: 30),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 71),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset('assets/images/homelogo.png')],
                ),
              ),
            ),
            const SizedBox(height: 70),

            // Making Result for the Game
            Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(top: 50,bottom: 45,left: 80,right: 80),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF0D47A1)
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Image.asset('assets/images/win_logo.png'),

                        const Spacer(),

                         Text(widget.winner,
                          style: const TextStyle(color: Colors.white, fontSize: 20),),

                        const Text("WON",
                        style: TextStyle(color: Colors.white,fontSize: 40, fontWeight: FontWeight.bold),)

                      ],
                    ),
                ),
                  ),

            const Spacer(),

            Row(
              children: [

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => LeaderBoard(widget.winners)));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 45, bottom: 65),
                    height: 60,
                    width: 220,
                    decoration: BoxDecoration(color: const Color(0xFF0D47A1),
                        border: Border.all(color: const Color(0xFF0D47A1)),
                        borderRadius: BorderRadius.circular(100)),
                    child: Container(
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(Icons.dehaze, color: Colors.white,),
                          SizedBox(width: 20),
                          Text("LeaderBoard",
                            style: TextStyle(color: Colors.white, fontSize: 20),)
                        ],
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScr()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 50, bottom: 70),
                    child: const Icon(
                      Icons.refresh_sharp, color: Color(0xFF0D47A1), size: 55,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}
