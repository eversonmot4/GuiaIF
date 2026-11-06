import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guiaif/core/widgets/button_alternativa.dart';

class Cardgame01 extends StatelessWidget {
  final int cardAtual;
  final int totalCards;
  final String? selectedOption;
  final ValueChanged<String?> onSelectOption;

  const Cardgame01({
    super.key,
    required this.cardAtual,
    required this.totalCards,
    required this.selectedOption,
    required this.onSelectOption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
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
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.openSans(
                    fontSize: 10,
                    color: const Color(0xFF4C8C30),
                  ),
                  children: [
                    const TextSpan(text: "Card: "),
                    TextSpan(
                      text: "$cardAtual",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: " / $totalCards"),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const Spacer(),
            Text(
              "Reunir os colegas no intervalo para jogar baralho apostando dinheiro ou lanches.",
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2B2B2B),
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Text(
              "Escolha sua resposta:",
              style: GoogleFonts.openSans(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 10),
            RadioGroup<String>(
              groupValue: selectedOption,
              onChanged: onSelectOption,
              child: Column(
                children: [
                  ButtonAlternativa(
                    letra: "A",
                    titulo: "Posso",
                    subtitulo: "Permitido sem restrições",
                    isSelected: selectedOption == "A",
                    onTap: () => onSelectOption("A"),
                  ),
                  const SizedBox(height: 10),
                  ButtonAlternativa(
                    letra: "B",
                    titulo: "Não posso",
                    subtitulo: "Infração leve",
                    isSelected: selectedOption == "B",
                    onTap: () => onSelectOption("B"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}