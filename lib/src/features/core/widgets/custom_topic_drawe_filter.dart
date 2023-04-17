import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vagas_flutter_mobile/src/features/core/styles/text_styles.dart';
import '../model/filter_options.dart';
import '../styles/app_colors.dart';
import 'bloc/custom_drawer_bloc.dart';
import 'custom_check_box_button.dart';

class CustomTopicDrawerFilter extends StatelessWidget {
  final String title;
  final String type;
  final List<FilterOptions> listFilter;
  const CustomTopicDrawerFilter({
    Key? key,
    required this.title,
    required this.type,
    required this.listFilter,
  }) : super(key: key);

  static String regimeString = "";

  @override
  Widget build(BuildContext context) {
    final listType =
        listFilter.where((filter) => filter.type.contains(type)).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        Text(
          title,
          style: context.textStyles.textFilter.copyWith(
            fontSize: 16,
            color: AppColors.darker,
          ),
        ),
        SizedBox(height: 16),
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 28,
          ),
          itemCount: listType.length,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(bottom: 12),
            child: CustomCheckBoxButton(
              text: listType[index].title,
              isSelect: listType[index].isSelected,
              onTap: () {
                listType[index].isSelected = !listType[index].isSelected;
                context.read<CustomDrawerBloc>().add(
                      SelectedCustomDrawerEvent(
                        isRegimeClt: listType[index].title == "CLT"
                            ? listType[index].isSelected
                            : null,
                        isRegimePj: listType[index].title == "PJ"
                            ? listType[index].isSelected
                            : null,
                        isModalityRemote: listType[index].title == "Remoto"
                            ? listType[index].isSelected
                            : null,
                        isModalityPresential:
                            listType[index].title == "Presencial"
                                ? listType[index].isSelected
                                : null,
                        isModalityHibrid: listType[index].title == "Híbrido"
                            ? listType[index].isSelected
                            : null,
                      ),
                    );
              },
            ),
          ),
        ),
        Divider(
          height: 0,
          color: AppColors.lightHover,
          thickness: 1,
        ),
      ],
    );
  }
}
