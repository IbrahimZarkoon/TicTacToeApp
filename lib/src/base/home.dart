
import 'package:flutter/material.dart';
import 'package:tictactoe/src/base/win_screen.dart';

import 'leaderboard.dart';

class HomeScr extends StatefulWidget {

  const HomeScr({Key? key}) : super(key: key);

  @override
  State<HomeScr> createState() => _HomeScrState();
}


class _HomeScrState extends State<HomeScr> {

  List<String> winners = [];

  List<String> GameGrid = ["","","","","","","","",""];
  int boxesfilled = 0;
  bool oTurn = true;

  bool winCon = false;



  @override
  Widget build(BuildContext context) {

    return winCon? WinScr(winners.last, winners) : Scaffold(
      
      backgroundColor: Colors.white,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 71),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset('assets/images/homelogo.png')],
            ),
          ),
          const SizedBox(height: 70),

          // Making Grid for the Game

          Container(
            margin: const EdgeInsets.only(left: 30,right: 30),
            height: 600,
            child: GridView.builder(itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: (){

                    _onTapped(index);

                },
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 30, ),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFC5C5C5))
                  ),
                  child: Center(
                    child: Text(GameGrid[index],
                    style:  TextStyle(color: GameGrid[index] == "O"? const Color(0xFF42A5F5) : const Color(0xFF0D47A1), fontSize: 75),),
                  ),
                ),
              );
                }),
          ),

             const Spacer(),

          Row(
            children: [
              GestureDetector(
                onTap: _navigateToResults,
                child: Container(
                  margin: const EdgeInsets.only(left: 45, bottom: 65 ),
                  height: 60, width: 220,
                  decoration: BoxDecoration(color: const Color(0xFF0D47A1),
                  border: Border.all(color: const Color(0xFF0D47A1)),
                  borderRadius: BorderRadius.circular(100)),
                  child: Container(
                    margin: const EdgeInsets.only(left: 30,right: 30),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.dehaze,color: Colors.white,),
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
                onTap: reset,
                child: Container(
                  margin: const EdgeInsets.only(right: 50, bottom: 70),
                  child: const Icon(Icons.refresh_sharp, color: Color(0xFF0D47A1), size: 55,),
                ),
              )
            ],
          )
        ],
      ),

    );
  }

  void _onTapped(int index)
  {
    setState(() {

      if(oTurn && GameGrid[index] == "" ){
        GameGrid[index] = "O";
        boxesfilled++;
      }else if(!oTurn && GameGrid[index] == ""){
        GameGrid[index] = "X";
        boxesfilled++;
      }
      oTurn = !oTurn;

    });
    _checkWinner();
  }

    reset()
  {
    setState(() {
      GameGrid = ['','','','','','','','',''];
      winCon = false;
      boxesfilled = 0;
    });

    }

    _checkWinner() {
      if( (GameGrid[0] == "O" && GameGrid[1] == "O" && GameGrid[2] == "O")
          || (GameGrid[3] == "O" && GameGrid[4] == "O" && GameGrid[5] == "O")
          || (GameGrid[6] == "O" && GameGrid[7] == "O" && GameGrid[8] == "O")
          || ( GameGrid[0] == "O" && GameGrid[3] == "O" && GameGrid[6] == "O")
          || (GameGrid[1] == "O" && GameGrid[4] == "O" && GameGrid[7] == "O")
          || (GameGrid[2] == "O" && GameGrid[5] == "O" && GameGrid[8] == "O")
          || (GameGrid[2] == "O" && GameGrid[5] == "O" && GameGrid[8] == "O")
          || (GameGrid[0] == "O" && GameGrid[4] == "O" && GameGrid[8] == "O")
          || (GameGrid[2] == "O" && GameGrid[4] == "O" && GameGrid[6] == "O"))
      {
        setState(() {
          winners.add("Player 1 ");
          winCon = true;
        });

      }
      else if ( (GameGrid[0] == "X" && GameGrid[1] == "X" && GameGrid[2] == "X")
          || (GameGrid[3] == "X" && GameGrid[4] == "X" && GameGrid[5] == "X")
          || (GameGrid[6] == "X" && GameGrid[7] == "X" && GameGrid[8] == "X")
          || ( GameGrid[0] == "X" && GameGrid[3] == "X" && GameGrid[6] == "X")
          || (GameGrid[1] == "X" && GameGrid[4] == "X" && GameGrid[7] == "X")
          || (GameGrid[2] == "X" && GameGrid[5] == "X" && GameGrid[8] == "X")
          || (GameGrid[2] == "X" && GameGrid[5] == "X" && GameGrid[8] == "X")
          || (GameGrid[0] == "X" && GameGrid[4] == "X" && GameGrid[8] == "X")
          || (GameGrid[2] == "X" && GameGrid[4] == "X" && GameGrid[6] == "X"))
      {
        setState(() {
          winners.add("Player 2 ");
          winCon = true;
        });

      }
      else if(boxesfilled == 9){
        setState(() {
          winners.add("Drawn ");
          winCon = true;

        });
      }
    }

  _navigateToResults()
  {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (_) =>  LeaderBoard(winners)));
    });
  }

}


