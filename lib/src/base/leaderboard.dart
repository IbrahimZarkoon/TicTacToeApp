import 'package:flutter/material.dart';
import 'package:tictactoe/src/base/home.dart';

class LeaderBoard extends StatefulWidget {


   List<String> records ;

   LeaderBoard(this.records, {Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Container(
            margin: const EdgeInsets.only(left: 32, right: 32, top: 60,bottom: 56),
            child: Row(

              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    GestureDetector(
                      onTap: _navigateToHome,
                      child: const Icon(Icons.arrow_back_ios, size: 25, color: Colors.black),
                    )
                  ],

                ),

                const SizedBox(width: 35),

                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: const [
                    Text("L E A D E R ",
                    style: TextStyle(color: Color(0xFF0D47A1),fontSize: 25, fontWeight: FontWeight.bold)),

                    Text("B O A R D ",
                        style: TextStyle(color: Color(0xFF0D47A1),fontSize: 35, fontWeight: FontWeight.bold)),
                  ],

                ),
              ],
            ),

          ),

          const SizedBox(height: 55),

          // List of Records

          Expanded(
            child:

              ListView.builder(
                    itemCount: widget.records.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                          return _winnerRecords(context, index);
                          }
          ),


          )
        ],
      ),

    );
  }

   _winnerRecords(BuildContext context, int index)
  {
    return Container(
      height: 100, width: 380,
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),

      color: const Color(0xFFF5F5F5),

      child: Row(


        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [


          _check(index),

          const SizedBox(width: 25),

          Text(widget.records[index],
          style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),

          const Spacer(),

          Container(
              padding: const EdgeInsets.all(10),
              child: Image.asset('assets/images/trophy_logo.png')),

          const SizedBox(width: 20),

        ],
      ),
    );
  }

  _check(int index)
  {
    if(widget.records[index] == "Player 1 ")
      {
        return Container(
            padding: const EdgeInsets.all(20),

            child:Image.asset('assets/images/o_logo.png'));
      }
    else if (widget.records[index] == "Player 2 ")
      {
        return Container(
            padding: const EdgeInsets.all(20),

            child:Image.asset('assets/images/x_logo.png'));
      }
    else if(widget.records[index] == "Drawn ")
      {
        return const SizedBox(width: 102);
      }
  }

  void _navigateToHome()
  {

      Navigator.push(context, MaterialPageRoute(builder: (_) =>  const HomeScr()));

  }
}
