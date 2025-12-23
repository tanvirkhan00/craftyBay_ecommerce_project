import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_project/App/app_colors.dart';
import 'package:flutter/material.dart';

class homeCarouselSlider extends StatefulWidget {
  const homeCarouselSlider({super.key});

  @override
  State<homeCarouselSlider> createState() => _homeCarouselSliderState();
}

final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

class _homeCarouselSliderState extends State<homeCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 200.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
                _selectedIndex.value = index;
            },
            autoPlay: true
          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: TextStyle(fontSize: 16.0, color: Colors.black),)
                );
              },
            );
          }).toList(),
        ),
       const SizedBox(height: 4,),
       ValueListenableBuilder(
         valueListenable: _selectedIndex,
         builder: (context, selectedIndex, _) {
           return Row(
             spacing: 4,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               for(int i=0; i<5; i++ )
                 Container(
                   height: 15,
                   width: 15,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                       color: i == selectedIndex ? AppColors.themeColor : null,
                       border: Border.all(color: Colors.grey)
                   ),
                 )
             ],
           );
         }
       )
      ],
    );
  }
}
