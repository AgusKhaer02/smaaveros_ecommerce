import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../api/api.dart';
import '../../../../../api/carousel/ListCarouselResponse.dart';
class CarouselOffers extends StatefulWidget {

  final List<Data> listCarousel;
  const CarouselOffers({
    Key? key, required this.listCarousel,
  }) : super(key: key);

  @override
  State<CarouselOffers> createState() => _CarouselOffersState();
}

class _CarouselOffersState extends State<CarouselOffers> {

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.listCarousel.map((value) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 10),
          child: Image.network(
            value.imgCarousel!,
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
      ),
    );
  }
}
