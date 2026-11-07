import 'package:flutter/material.dart';
import 'package:guiaif/features/game01/game_01.dart';
import 'package:guiaif/features/game02/game_02.dart';
import 'package:guiaif/features/game03/widget/gabinete.dart';
import 'package:guiaif/features/guia_resumido/guiaresumido.dart';


// Seção de acessos rápidos
class QuickAccessSection extends StatelessWidget {
  const QuickAccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      (
        title: 'Posso ou não posso?',
        icon: Icons.quiz_outlined,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Game01();
          },));
        },
      ),
      (
        title: 'Qual é a gravidade?',
        icon: Icons.gavel_outlined,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Game02();
          },));
        },
      ),
      (
        title: 'Gabinete do Mediador',
        icon: Icons.groups_outlined,
        onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
            return GabineteMediadorPage();
          },));        },
      ),
      (
        title: 'Guia resumido',
        icon: Icons.menu_book_outlined,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return GuiaResumidoPage();
          },));
        },
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título da seção
        const Text(
          'Acessos rápidos',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 12),

        // Grade de cards
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                mainAxisExtent: 110,
              ),
          itemBuilder: (context, index) {
            final item = items[index];

            return Card(
              elevation: 1,
              color: const Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: item.onTap,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Ícone do card
                      Icon(
                        item.icon,
                        size: 28,
                        color: const Color(0xFF4C8C30),
                      ),

                      const Spacer(),

                      // Título e seta
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}