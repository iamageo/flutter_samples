import 'package:flutter/material.dart';

class CardModel {
  final String? cardHeader;
  final String? cardImg;
  final Color? color;
  final LinearGradient? cardColor;

  CardModel({this.cardHeader, this.cardImg, this.cardColor, this.color});
}

final List<CardModel> cardList = [
  CardModel(
    cardHeader: "Iron Man",
    cardImg: "assets/ironman.png",
    cardColor: LinearGradient(
      colors: [Colors.orange, Colors.orangeAccent]
    ),
    color: Colors.redAccent
  ),
  CardModel(
    cardHeader: "Iron Man",
    cardImg: "assets/ironman.png",
    cardColor:  LinearGradient(
        colors: [Colors.orange, Colors.orangeAccent]
    ),
    color: Colors.black
  ),
  CardModel(
    cardHeader: "Iron Man",
    cardImg: "assets/ironman.png",
    cardColor: LinearGradient(
        colors: [Colors.orange, Colors.orangeAccent]
    ),
    color: Colors.yellow
  )
];