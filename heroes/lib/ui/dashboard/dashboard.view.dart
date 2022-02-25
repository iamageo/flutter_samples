import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:heroes/ui/details/details.view.dart';

import '../../components/card_component.dart';
import '../../model/card_model.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: CarouselSlider.builder(
                  itemCount: cardList.length,
                  itemBuilder: (context, item, _) => (
                      Column(
                        children: [
                          Text(
                            cardList[item].cardHeader.toString(),
                            style: TextStyle(
                              fontSize: 38,
                              color: cardList[item].color,
                            ),
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 7,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(const Radius.circular(10)),
                                gradient: LinearGradient(
                                  colors: [Colors.yellow, Colors.orangeAccent],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Hero(
                                    tag: cardList[item].cardImg!,
                                    child: Image.asset(
                                      cardList[item].cardImg!,
                                      width: 250,
                                    ),
                                  ),
                              ),
                              ),
                          ),
                        ],
                      )
                  ),
                  options: CarouselOptions(
                    autoPlay: false,
                  ),

                ),),
            ],
        ),
    );
  }
}
