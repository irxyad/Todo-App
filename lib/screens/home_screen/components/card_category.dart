import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CardCategories extends StatelessWidget {
  const CardCategories({
    Key? key,
    required this.styleText,
    required this.gradient,
    required this.title,
    required this.teksProgress,
    required this.percent,
  }) : super(key: key);
  final List<Color> gradient;

  final TextTheme styleText;
  final String title;
  final String teksProgress;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 159,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              // colors: [Color(0xFFF95F09), Color(0xFFFF0743)],
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.2, 0.6]),
          borderRadius: BorderRadius.circular(30),
        ),
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: styleText.headline1!.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              CircularPercentIndicator(
                radius: 40,
                lineWidth: 6,
                animation: true,
                animationDuration: 3000,
                animateFromLastPercent: false,
                startAngle: 0.0,
                curve: Curves.fastOutSlowIn,
                addAutomaticKeepAlive: true,
                restartAnimation: false,
                backgroundColor: Colors.grey.shade500,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.white,
                percent: percent,
                center: Text(
                  teksProgress,
                  textAlign: TextAlign.center,
                  style: styleText.headline6!.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
