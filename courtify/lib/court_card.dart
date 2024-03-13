// ignore_for_file: use_super_parameters, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import, unused_import

import 'package:flutter/widgets.dart';
import 'appointment_card.dart';
import 'config.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//

class CourtCard extends StatefulWidget {
  const CourtCard({Key? key}) : super(key: key);

  @override
  State<CourtCard> createState() => _CourtState();
}
class _CourtState extends State <CourtCard>{
  @override
  Widget build (BuildContext context){
    Config().init(context);
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
    height: 150,
    child: GestureDetector(
      child: Card(
        elevation: 5, 
        color: Config.accentColor,
        child: Row(
           children: [
            SizedBox(
              width: Config.widthSize * 0.10,
              child: Image.asset('assets/coach.png', fit: BoxFit.fill),
            ),
            Flexible(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'SportsVille Court', 
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  Text(
                  'BasketBall Court', 
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.star_border, color: Colors.blueAccent, size:16),
                    Spacer(flex: 1, ), 
                    Text('4.5'),
                    Spacer(flex: 1, ),
                    Text('Reviews'),
                    Spacer(flex: 1, ),
                    Text('(20)'),
                    Spacer(flex:7,),
                  ],

                )
              ]
              ),
              )

              )
           ],
        ),
      ),
  onTap: (){},
    )
  );
}
}
