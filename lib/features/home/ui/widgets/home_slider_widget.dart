import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../data/models/slider_model.dart';

class HomeSliderWidget extends StatefulWidget {
  final List<SliderModel> sliders;

  const HomeSliderWidget({super.key, required this.sliders});

  @override
  State<HomeSliderWidget> createState() => _HomeSliderWidgetState();
}

class _HomeSliderWidgetState extends State<HomeSliderWidget> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.sliders.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.sliders.length,
          itemBuilder: (context, index, realIndex) {
            final slider = widget.sliders[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: slider.image != null
                    ? DecorationImage(
                        image: NetworkImage(slider.image!),
                        fit: BoxFit.cover,
                      )
                    : null,
                color: Colors.grey[300], // Fallback color
              ),
              child: slider.image == null 
                  ? const Center(child: Icon(Icons.image_not_supported)) 
                  : null,
            );
          },
          options: CarouselOptions(
            height: 180,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            viewportFraction: 0.9,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: widget.sliders.length,
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: Colors.black, // Dark color matching Figma
            dotColor: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}
