import 'dart:async';
import 'package:flutter/material.dart';
import 'package:guiaif/features/home/data/quiz_card_content.dart';

class RotatingQuizCard extends StatefulWidget {
  final List<QuizCardItem> items;
  final Duration interval;
  final VoidCallback? onTap;

  const RotatingQuizCard({
    super.key,
    required this.items,
    this.interval = const Duration(seconds: 8),
    this.onTap,
  });

  @override
  State<RotatingQuizCard> createState() => _RotatingQuizCardState();
}

class _RotatingQuizCardState extends State<RotatingQuizCard> {
  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startRotation();
  }

  void startRotation() {
    if (widget.items.length <= 1) return;

    timer = Timer.periodic(widget.interval, (_) {
      setState(() {
        currentIndex = (currentIndex + 1) % widget.items.length;
      });
    });
  }

  @override
  void didUpdateWidget(covariant RotatingQuizCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.items != widget.items ||
        oldWidget.interval != widget.interval) {
      timer?.cancel();
      currentIndex = 0;
      startRotation();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const SizedBox.shrink();
    }

    final item = widget.items[currentIndex];

    return Material(
      color: const Color(0xFF328526),
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título e ícone
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        layoutBuilder: (currentChild, previousChildren) {
                          return Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              ...previousChildren,
                              if (currentChild != null) currentChild,
                            ],
                          );
                        },
                        child: Text(
                          item.title,
                          key: ValueKey(item.title),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Icon(
                    Icons.sentiment_satisfied_alt_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Descrição dinâmica
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: Text(
                  item.description,
                  key: ValueKey(item.description),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}