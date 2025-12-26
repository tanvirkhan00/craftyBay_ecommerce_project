import 'package:ecommerce_project/App/app_colors.dart';
import 'package:flutter/material.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {

  int _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      spacing: 5,
      children: [
        GestureDetector(
          onTap: () {
            if(_currentValue>1)
            _currentValue--;
            widget.onChange(_currentValue);
            setState(() { });
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.themeColor,
              borderRadius: BorderRadius.circular(2)
            ),
            child: Icon(Icons.remove),
          ),
        ),
        Text("$_currentValue", style: TextTheme.of(context).titleLarge,),
        GestureDetector(
          onTap: (){
            _currentValue++;
            widget.onChange(_currentValue);
            setState(() {});
          } ,
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.circular(2)
            ),
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
