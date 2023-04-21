import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import 'package:vagas_flutter_mobile/src/features/core/widgets/bloc/custom_drawer_bloc.dart';
import '../styles/app_colors.dart';

class CustomDropDownMenu extends StatefulWidget {
  final List<String> cityNames;
  final TextEditingController textController;

  const CustomDropDownMenu({
    Key? key,
    required this.cityNames,
    required this.textController,
  }) : super(key: key);

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  List<String> get cityNames => [...widget.cityNames];
  @override
  Widget build(BuildContext context) {
    List<String> cityNamesList = cityNames;
    final int listLenght = cityNamesList.length < 4 ? cityNamesList.length : 4;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.light,
            border: cityNamesList.isNotEmpty
                ? Border.all(color: AppColors.darker)
                : const Border(),
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
                    final changeName = CustomDrawerBloc().filterCityname(
                        textController: widget.textController.value.text);
                    context
                        .read<CustomDrawerBloc>()
                        .add(SelectedCustomDrawerEvent(
                          cityList: changeName,
                          cityFilter: widget.textController.value.text,
                          isRealod: false,
                        ));
                  },
                  style: context.textStyles.textInterRegular.copyWith(
                    color: AppColors.darker,
                    fontSize: 12,
                  ),
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding: EdgeInsets.zero,
                      hintText: "Busque uma localidade...",
                      hintStyle: context.textStyles.textInterRegular.copyWith(
                        color: AppColors.lightPrimary,
                        fontSize: 12,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
            ],
          ),
        ),
        if (cityNamesList.isNotEmpty)
          BlocBuilder<CustomDrawerBloc, CustomDrawerState>(
            builder: (context, state) {
              if (state is SelectCustomDrawerState) {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listLenght,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        widget.textController.text = cityNamesList[index];

                        final changeName = CustomDrawerBloc().filterCityname(
                            textController: widget.textController.value.text);
                        context
                            .read<CustomDrawerBloc>()
                            .add(SelectedCustomDrawerEvent(
                              cityList: changeName,
                              cityFilter: widget.textController.value.text,
                              isRealod: false,
                            ));
                      },
                      borderRadius: BorderRadius.only(
                        bottomLeft:
                            Radius.circular(listLenght - 1 == index ? 4 : 0),
                        bottomRight:
                            Radius.circular(listLenght - 1 == index ? 4 : 0),
                      ),
                      splashColor: AppColors.primary,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 24),
                        decoration: BoxDecoration(
                          border: Border.fromBorderSide(
                              BorderSide(width: 1, color: AppColors.grey500)),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                                listLenght - 1 == index ? 4 : 0),
                            bottomRight: Radius.circular(
                                listLenght - 1 == index ? 4 : 0),
                          ),
                        ),
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
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
      ],
    );
  }
}
