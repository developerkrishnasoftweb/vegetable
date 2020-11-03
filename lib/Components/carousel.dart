import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  final List<CarouselItems> items;
  final double width, height;
  final BorderRadiusGeometry borderRadius;
  Carousel({@required this.items, @required this.width, this.height, this.borderRadius}) : assert(items != null && width != null);
  @override
  _CarouselState createState() => _CarouselState();
}
class _CarouselState extends State<Carousel> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius ?? null,
      ),
      child: CarouselSlider(
        items: widget.items.map((item) {
          return GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: item.image,
                  fit: BoxFit.fill,
                ),
                borderRadius: widget.borderRadius ?? null,
              ),
              child: Stack(
                children: [
                  Align(
                    child: RichText(
                      text: TextSpan(
                          text: item.title != null ? item.title : "",
                          style: TextStyle(fontSize: 25, color: Colors.grey),
                          children: [
                            TextSpan(
                                text: item.subtitle != null
                                    ? "\n" + item.subtitle
                                    : "",
                                style: TextStyle(fontSize: 15, color: Colors.grey)),
                          ]),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.items.map((i) {
                        int index = widget.items.indexOf(i);
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 800),
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            color:
                            _index == index ? Colors.blue : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            onTap: item.onTap,
          );
        }).toList(),
        options: CarouselOptions(
            initialPage: 1,
            height: widget.height ?? 200,
            autoPlay: true,
            viewportFraction: 1,
            aspectRatio: 16 / 9,
            // autoPlayCurve: Curves.easeInToLinear,
            // enlargeCenterPage: true,
            autoPlayAnimationDuration: Duration(milliseconds: 900),
            onPageChanged: (index, reason) {
              setState(() {
                _index = index;
              });
            }),
      ),
    );
  }
}


class CarouselItems {
  final String title, subtitle;
  final ImageProvider image;
  final GestureTapCallback onTap;
  CarouselItems({@required this.image, this.title, this.subtitle, this.onTap});
}
