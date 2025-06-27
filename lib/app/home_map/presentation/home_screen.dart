import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:mbankapp/app/home_map/clusterdemo/clusterdemo.dart';
import 'package:mbankapp/app/home_map/clusterdemo/model/cluster_point.dart';
import 'package:mbankapp/app/utils/map_avalible_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Example();
  }
}

class Example extends StatelessWidget {
  Example({super.key});

  List<Container> cards = [
    Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: const Text('1'),
    ),
    Container(
      alignment: Alignment.center,
      color: Colors.red,
      child: const Text('2'),
    ),
    Container(
      alignment: Alignment.center,
      color: Colors.purple,
      child: const Text('3'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Flexible(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: CardSwiper(
              numberOfCardsDisplayed: 3,
              backCardOffset: const Offset(0, -100),
              cardsCount: cards.length,
              cardBuilder: (context, index, percentThresholdX, percentThresholdY) => cards[index],
            ),
          ),
        ),
      ),
    );
  }
}
