

import 'package:carousel_slider/carousel_slider.dart';
import 'package:feeling_metter/provider/select_provider.dart';
import 'package:flutter/material.dart';

class CustomCoursel extends StatelessWidget {
  const CustomCoursel({
    super.key,
    required this.items,
    required this.carouselProvider,
  });

  final List<Map<String, String>> items;
  final CarouselProvider carouselProvider;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: items.length,
      itemBuilder: (context, index, realIndex) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            carouselProvider.setCurrentIndex(index);
          },
          child: Column(
            children: [
              // Circular Image
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: carouselProvider.currentIndex == index
                        ? Colors.orange
                        : Colors.grey,
                    width: 3,
                  ),
                  image: DecorationImage(
                    image: AssetImage(item['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Text Below Image
              Text(
                item['text']!,
                style: TextStyle(
                  fontSize: 16,
                  color: carouselProvider.currentIndex == index
                      ? Colors.orange
                      : Colors.black,
                  fontWeight: carouselProvider.currentIndex == index
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        height: 120.0,
        enlargeCenterPage: true, // Focus on the center item
        viewportFraction: 0.4, // Show partial items on the sides
        onPageChanged: (index, reason) {
          carouselProvider.setCurrentIndex(index);
        },
      ),
    );
  }
}