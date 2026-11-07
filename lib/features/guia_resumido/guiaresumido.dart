import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guiaif/core/url_launcher/url_launcher.dart';
import 'package:guiaif/core/widgets/official_document_card.dart';

class GuiaResumidoPage extends StatelessWidget {
  const GuiaResumidoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.arrow_back, color: Color.fromARGB(221, 0, 0, 0)),
        //   ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Guia Resumido",
               style: GoogleFonts.openSans(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Regimento sem complicação",
              style: GoogleFonts.openSans(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Superior Verde
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF4C8C30),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Entenda o regimento sem juridiquês.",
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Icon(Icons.menu_book, color: Colors.white, size: 32),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Os pontos mais importantes sobre direitos, deveres e convivência, resumidos para consultar quando precisar.",
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 30),
            
            Text(
              "Resumo por tema",
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Lista de Tópicos
            _buildTopicCard(
              icon: Icons.shield_outlined,
              iconColor: const Color(0xFF4C8C30),
              label: "GARANTIAS",
              title: "Direitos do estudante",
              description: "O que o Instituto deve assegurar durante sua trajetória acadêmica.",
            ),
            _buildTopicCard(
              icon: Icons.check_circle_outline,
              iconColor: Colors.blue,
              label: "RESPONSABILIDADES",
              title: "Deveres e convivência",
              description: "Atitudes esperadas para manter um ambiente seguro e acolhedor.",
            ),
            _buildTopicCard(
              icon: Icons.warning_amber_rounded,
              iconColor: Colors.orange,
              label: "ATENÇÃO",
              title: "Condutas e infrações",
              description: "Como as ocorrências são classificadas de acordo com impacto e gravidade.",
            ),
            _buildTopicCard(
              icon: Icons.gavel,
              iconColor: Colors.red,
              label: "PROCESSO JUSTO",
              title: "Medidas e direito à defesa",
              description: "O caminho educativo adotado antes e depois de uma decisão disciplinar.",
            ),

            const SizedBox(height: 20), 
            OfficialDocumentCard(
              title: 'Quer conferir todos os detalhes?',
              description: 'Consulte a versão integral publicada pelo IFMA.',
              buttonText: 'Abrir documento original',
              onPressed: openOfficialDocument,
            )

            // Banner Inferior (Link Oficial)
            // Container(
            //   padding: const EdgeInsets.all(20),
            //   decoration: BoxDecoration(
            //     color: const Color(0xFF4C8C30),
            //     borderRadius: BorderRadius.circular(8),
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             "Quer conferir todos os detalhes?",
            //             style: GoogleFonts.openSans(
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.white,
            //             ),
            //           ),
            //           const Icon(Icons.book, color: Colors.white),
            //         ],
            //       ),
            //       const SizedBox(height: 12),
            //       Text(
            //         "FONTE OFICIAL",
            //         style: GoogleFonts.openSans(fontSize: 10, color: Colors.white70, fontWeight: FontWeight.bold),
            //       ),
            //       Text(
            //         "Consulte a versão integral publicada pelo IFMA.",
            //         style: GoogleFonts.openSans(fontSize: 13, color: Colors.white),
            //       ),
            //       const SizedBox(height: 16),
            //       SizedBox(
            //         width: double.infinity,
            //         child: ElevatedButton.icon(
            //           style: ElevatedButton.styleFrom(
            //             backgroundColor: Colors.white,
            //             foregroundColor: const Color(0xFF4C8C30),
            //             padding: const EdgeInsets.symmetric(vertical: 12),
            //           ),
            //           icon: const Icon(Icons.open_in_new, size: 18),
            //           label: Text(
            //             "Abrir documento original",
            //             style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
            //           ),
            //           onPressed: () {
            //             // Lógica de abrir URL aqui
            //           },
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Método auxiliar para construir os cartões de tópicos padronizados
  Widget _buildTopicCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade100, blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.openSans(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: iconColor,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  title,
                  style: GoogleFonts.openSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.openSans(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
}
