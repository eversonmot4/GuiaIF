import 'package:flutter/material.dart';
import 'widgets/card_reposta.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/card_game_01.dart';
import 'package:guiaif/core/widgets/buttons_pass_alternativa.dart';

class Game01 extends StatefulWidget {
  const Game01({super.key});

  @override
  State<Game01> createState() => _Game01State();
}

class _Game01State extends State<Game01> {
  int _cardAtual = 1;
  final int _totalCards = 10;
  String? _selectedOption;
  final bool mostrarResp = true;

  void _proximoCard() {
    if (_cardAtual < _totalCards) {
      setState(() {
        _cardAtual++;
        _selectedOption = null;
      });
    }
  }

  void _cardAnterior() {
    if (_cardAtual > 1) {
      setState(() {
        _cardAtual--;
        _selectedOption = null;
      });
    }
  }

  void _selecionarOpcao(String? opcao) {
    setState(() {
      _selectedOption = opcao;
    });
  }

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
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.arrow_back, color: Colors.black87),
        // ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Posso ou não Posso?",
              style: GoogleFonts.openSans(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "Mini game interativo",
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
          Container(
            width: double.infinity,
            height: 195,
            decoration: const BoxDecoration(
              color: Color(0xFF4C8C30),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Determine com base no seu conhecimento sobre o Regimento estudantil quais atos são permitidos ou não.",
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            Transform.rotate(
                              angle: -0.04,
                              child: Container(
                                width: 310,
                                height: constraints.maxHeight - 10,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.08),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Transform.rotate(
                              angle: 0.04,
                              child: Container(
                                width: 310,
                                height: constraints.maxHeight - 10,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.08),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            mostrarResp?
                            Cardgame01(
                              cardAtual: _cardAtual,
                              totalCards: _totalCards,
                              selectedOption: _selectedOption,
                              onSelectOption: _selecionarOpcao,
                            ):
                            Cardgame01resposta(respCorreta: true),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonpassCard(
                          icon: Icons.arrow_back,
                          onPressed: _cardAnterior,
                        ),
                        ButtonpassCard(
                          icon: Icons.arrow_forward,
                          onPressed: _proximoCard,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}