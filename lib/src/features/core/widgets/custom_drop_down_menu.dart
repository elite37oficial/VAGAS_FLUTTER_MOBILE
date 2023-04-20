import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';

import '../styles/app_colors.dart';

class CustomDropDownMenu extends StatefulWidget {
  final List<String> cityNames;
  final TextEditingController textController;
  final Function onTap;
  const CustomDropDownMenu({
    Key? key,
    required this.cityNames,
    required this.textController,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  // List<String> get cityNamesList => [...cityNames];
  @override
  Widget build(BuildContext context) {
    List<String> cityNamesList = widget.cityNames;
    final int listLenght = cityNamesList.length < 4 ? cityNamesList.length : 4;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.light,
            border: cityNamesList.length > 0
                ? Border.all(color: AppColors.darker)
                : Border(),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  "assets/images/map-pin.svg",
                  height: 16,
                  width: 16,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: widget.textController,
                  onChanged: (_) {
                    widget.onTap();
                    setState(() {
                      cityNamesList = cityNamesList
                          .where((city) => city.toLowerCase().contains(
                              widget.textController.value.text.toLowerCase()))
                          .toList();
                    });
                    print(cityNamesList);
                    // print(list);
                    // cityNamesList = cityNamesList.contains(textController.value.text);
                  },
                  style: context.textStyles.textInterRegular.copyWith(
                    color: AppColors.darker,
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: EdgeInsets.zero,
                      // icon: SvgPicture.asset(
                      //   "assets/images/map-pin.svg",
                      // ),
                      hintText: "Busque uma localidade...",
                      hintStyle: context.textStyles.textInterRegular.copyWith(
                        color: AppColors.lightPrimary,
                        fontSize: 12,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )
                      // border:
                      //     OutlineInputBorder(
                      //   borderRadius:
                      //       BorderRadius
                      //           .circular(4),
                      //   borderSide:
                      //       BorderSide.none,
                      // ),
                      // filled: true,
                      // fillColor: AppColors.light,
                      // label: Text(
                      //   "Busque uma localidade...",
                      //   style: context.textStyles
                      //       .textInterRegular
                      //       .copyWith(
                      //     color:
                      //         AppColors.lightPrimary,
                      //     fontSize: 12,
                      //   ),
                      // ),
                      ),
                ),
              ),
            ],
          ),
        ),
        if (cityNamesList.length > 0)
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: listLenght,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  widget.textController.text = cityNamesList[index];
                  // cityNamesList = cityNamesList[index];
                },
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(listLenght - 1 == index ? 4 : 0),
                  bottomRight: Radius.circular(listLenght - 1 == index ? 4 : 0),
                ),
                splashColor: AppColors.primary,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),

                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(width: 1, color: AppColors.grey500)),
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(listLenght - 1 == index ? 4 : 0),
                      bottomRight:
                          Radius.circular(listLenght - 1 == index ? 4 : 0),
                    ),
                  ),
                  // height: 35,
                  child: Text(
                    cityNamesList[index],
                    style: context.textStyles.textInterRegular.copyWith(
                      fontSize: 16,
                      color: AppColors.darker,
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
