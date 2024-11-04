import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int _currentIndex = 0;

  final List<String> imgList = [
    'lib/assets/logo/loading2.gif',
    'lib/assets/logo/loading2.gif',
    'lib/assets/logo/loading2.gif',
    'lib/assets/logo/loading2.gif',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(),
            width: 396,
            height: 185,
            decoration: BoxDecoration(
              color: const Color(0xFFDC6608).withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
            ),
            child: CarouselSlider(
              items: imgList
                  .map((item) => Image.asset(item,
                      fit: BoxFit.fitWidth, width: double.infinity))
                  .toList(),
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => setState(() {
                  _currentIndex = entry.key;
                }),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
