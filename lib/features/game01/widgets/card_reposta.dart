import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cardgame01resposta extends StatelessWidget {
  final bool respCorreta; 

  const Cardgame01resposta({super.key, required this.respCorreta});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: double.infinity,
      decoration: BoxDecoration(
        color: respCorreta ? Color(0xFF5EAF3C) : Color(0xFFD63336) ,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 15,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0)
              ),
              child: 
                Icon(
                  respCorreta ? Icons.check :Icons.not_interested_sharp ,
                  size: 50,
                  color:respCorreta ? Color(0xFF5EAF3C) : Color(0xFFD63336),
                ),
            ),)
            ,
            SizedBox(height: 30),
            Center(
              child: Text("preve explicação sobre essa regra....", 
                style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),textAlign:TextAlign.justify),
            )
          ],
        ),
      ),
    );
  }
}