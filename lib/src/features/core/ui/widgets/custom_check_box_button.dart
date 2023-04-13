// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';

import '../styles/app_colors.dart';

class CustomCheckBoxButton extends StatefulWidget {
  final int index;
  final String text;
  const CustomCheckBoxButton({
    Key? key,
    required this.index,
    required this.text,
  }) : super(key: key);

  @override
  State<CustomCheckBoxButton> createState() => _CustomCheckBoxButtonState();
}

class _CustomCheckBoxButtonState extends State<CustomCheckBoxButton> {
  // List<bool> _isSelected = [false, false, false, false, false];
  // void _toggleSelection(int index) {
  //   setState(() {
  //     _isSelected[index] = !_isSelected[index];
  //   });
  // }

  // void _clearSelection() {
  //   setState(() {
  //     _isSelected = List.generate(_isSelected.length, (index) => false);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => _toggleSelection(widget.index),
      child: Row(
        children: [
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              // color: _isSelected[widget.index] ? AppColors.active : null,
              border: Border.all(
                width: 1,
                color: AppColors.darker,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            // child: _isSelected[widget.index]
            //     ? Icon(
            //         Icons.check,
            //         weight: 8,
            //         size: 15,
            //         color: Colors.white,
            //       )
            //     : null,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            widget.text,
            style: context.textStyles.textFilter.copyWith(
              fontSize: 14,
              color: AppColors.darker,
            ),
          ),
        ],
      ),
    );
  }
}
