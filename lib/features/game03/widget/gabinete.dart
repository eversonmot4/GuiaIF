import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GabineteMediadorPage extends StatefulWidget {
  const GabineteMediadorPage({super.key});

  @override
  State<GabineteMediadorPage> createState() => _GabineteMediadorPageState();
}

class _GabineteMediadorPageState extends State<GabineteMediadorPage> {
  int _selectedOption = 2; // Inicia com a 3ª opção selecionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Gabinete do Mediador",
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "Termômetro de conduta",
              style: GoogleFonts.openSans(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 180,
            color: const Color(0xFF4C8C30),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Gabinete do Mediador",
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.gavel, color: Color(0xFF4C8C30), size: 16),
                          const SizedBox(width: 4),
                          Text(
                            "Caso #04",
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF4C8C30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green.shade50,
                            child: const Icon(Icons.person_outline, color: Colors.green),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PERFIL DO ENVOLVIDO",
                                style: GoogleFonts.openSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                "Aluno 1º Ano · Novato",
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "O estudante causou danos acidentais a uma cadeira escolar durante uma brincadeira no corredor, sendo seu primeiro registro disciplinar.",
                        style: GoogleFonts.openSans(fontSize: 14, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "PONTOS PARA ANÁLISE",
                        style: GoogleFonts.openSans(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildChip("Atenuante", "Aluno novato (Art. 50)", Icons.check_circle_outline, Colors.green),
                          _buildChip("Atenuante", "Primeiro ato indisciplinar", Icons.check_circle_outline, Colors.green),
                          _buildChip("Patrimônio", "Reparação necessária (Art. 24)", Icons.build_circle_outlined, Colors.orange),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Text(
                  "Como mediador pedagógico, qual é a medida inicial recomendada e justa?",
                  style: GoogleFonts.openSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),

                // Voltamos para a estrutura simples, direta na Column
                Column(
                  children: [
                    _buildRadioOption(0, "Desligamento imediato do campus com notificação judicial", Icons.close),
                    _buildRadioOption(1, "Advertência escrita direta com suspensão de 5 dias sem direito à defesa", Icons.edit_document),
                    _buildRadioOption(2, "Advertência oral/orientativa com diálogo pedagógico e compromisso de reparação do bem", Icons.check),
                  ],
                ),

                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4C8C30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Confirmar Deliberação",
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String prefix, String text, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            "$prefix ",
            style: GoogleFonts.openSans(fontSize: 11, fontWeight: FontWeight.bold, color: color),
          ),
          Text(
            text,
            style: GoogleFonts.openSans(fontSize: 11, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioOption(int value, String text, IconData icon) {
    bool isSelected = _selectedOption == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = value;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: isSelected ? const Color(0xFF4C8C30) : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            // Comando especial para o Dart silenciar os avisos nesta função específica
            // ignore: deprecated_member_use
            Radio<int>(
              value: value,
              // ignore: deprecated_member_use
              groupValue: _selectedOption,
              activeColor: const Color(0xFF4C8C30),
              // ignore: deprecated_member_use
              onChanged: (int? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedOption = newValue;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}