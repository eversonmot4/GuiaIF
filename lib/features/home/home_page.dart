
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guiaif/core/theme/images.dart';
import 'package:guiaif/features/home/widgets/quick_access_section.dart';
import 'package:guiaif/features/home/data/quiz_card_content.dart';
import 'package:guiaif/core/widgets/rotating_quiz_card.dart';

// Página de início
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Cabeçalho
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(50, 160, 65, 1),
        toolbarHeight: 80,

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Olá, Estudante!",
              style: GoogleFonts.openSans(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "É BOM VER VOCÊ POR AQUI",
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),

        // Logomarca do IFMA
        actions: [
          Container(
            width: 155,
            height: 60,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              AppImages.logoHorizontalIFMA,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),

      // Conteúdo da página
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RotatingQuizCard(
              items: quizCardContent,
              interval: const Duration(seconds: 8),
              onTap: () {
                // Navegar para a tela do minijogo
              },
            ),

            const SizedBox(height: 20),

            // Acessos rápidos
            const QuickAccessSection(),

            const SizedBox(height: 24),

            // Widget do documento completo
          ],
        ),
      ),
    );
  }
}