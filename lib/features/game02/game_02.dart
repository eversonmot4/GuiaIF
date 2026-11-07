import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guiaif/core/widgets/fundo_verde.dart';

class Game02 extends StatefulWidget{
  const Game02({super.key});

  @override
  State<Game02> createState() => _Game02State();
}

class _Game02State extends State<Game02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        surfaceTintColor: Colors.white,
        toolbarHeight: 65,
        
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Qual é a gravidade?",
              style: GoogleFonts.openSans(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "Atos e Consequências",
              style: GoogleFonts.openSans(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          BackgroundGreen(), //fundo_verde
        ],

      ),

    );
  }
}