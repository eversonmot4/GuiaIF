import 'package:flutter/widgets.dart';

class BackgroundGreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: double.infinity,
            height: 195,
            decoration: const BoxDecoration(
              color: Color(0xFF4C8C30),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          );
  }
}