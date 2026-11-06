import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAlternativa extends StatelessWidget {
  final String letra;
  final String titulo;
  final String subtitulo;
  final bool isSelected;
  final VoidCallback onTap;

  const ButtonAlternativa({
    super.key,
    required this.letra,
    required this.titulo,
    required this.subtitulo,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isSelected ? const Color(0xFF4C8C30) : const Color(0xFFE0E0E0),
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFEEEEEE),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                letra,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: const Color(0xFF65716A),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    subtitulo,
                    style: GoogleFonts.openSans(
                      fontSize: 10,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Radio<String>(
              value: letra,
              activeColor: const Color(0xFF4C8C30),
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
      ),
    );
  }
}