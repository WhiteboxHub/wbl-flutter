import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: [
        'assets/carousel/ML1.jpeg',
        'assets/carousel/ML3.jpeg',
        'assets/carousel/html-css-JS.webp',
        'assets/carousel/js-libs.png',
        'assets/carousel/testing-libs-JS.png',
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  i,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Text('Image not found'),
                    );
                  },
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
