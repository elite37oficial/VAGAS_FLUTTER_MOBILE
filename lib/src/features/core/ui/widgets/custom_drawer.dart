import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';

import 'custom_check_box_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> cityNames = [
      'Rio de Janeiro/RN - BR',
      'São Paulo/SP - BR',
      'Parnaíba/PI - BR',
      'Garanhuns/PE - BR',
      'Jacuturu/PR - BR'
    ];
    final List<DropdownMenuEntry<String>> cityEntries =
        cityNames.map((String cityName) {
      return DropdownMenuEntry<String>(
        value: cityName,
        label: cityName,
      );
    }).toList();
    return Stack(
      children: <Widget>[
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            width: 300,
            height: 679,
            child: Drawer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Filtrar por',
                              style:
                                  context.textStyles.textInterRegular.copyWith(
                                fontSize: 18,
                                color: AppColors.darker,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                'assets/images/IconCloseAppVagas.svg',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                          height: 0, color: AppColors.lightHover, thickness: 1),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 24, bottom: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tipo de Contrato",
                                    style:
                                        context.textStyles.textFilter.copyWith(
                                      fontSize: 16,
                                      color: AppColors.darker,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      CustomCheckBoxButton(
                                          index: 0, text: 'CLT'),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      CustomCheckBoxButton(
                                        index: 1,
                                        text: 'PJ (Pessoa Jurídica)',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 0,
                              color: AppColors.lightHover,
                              thickness: 1,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 24, bottom: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Modalidade",
                                    style:
                                        context.textStyles.textFilter.copyWith(
                                      fontSize: 16,
                                      color: AppColors.darker,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          CustomCheckBoxButton(
                                              index: 2, text: 'Remoto'),
                                          SizedBox(
                                            width: 24,
                                          ),
                                          CustomCheckBoxButton(
                                              index: 3, text: 'Presencial'),
                                        ],
                                      ),
                                      SizedBox(height: 16),
                                      CustomCheckBoxButton(
                                          index: 4, text: 'Hibrido')
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 0,
                              color: AppColors.lightHover,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 24, bottom: 12, right: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Localização",
                                    style:
                                        context.textStyles.textFilter.copyWith(
                                      fontSize: 16,
                                      color: AppColors.darker,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    height: 32,
                                    width: 268,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColors.light,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/map-pin.svg",
                                          height: 16,
                                          width: 16,
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          width: 200,
                                          child: Center(
                                            child: DropdownMenu(
                                              trailingIcon: SizedBox.shrink(),
                                              inputDecorationTheme:
                                                  InputDecorationTheme(
                                                alignLabelWithHint: true,
                                                contentPadding:
                                                    EdgeInsets.all(0),
                                                border: InputBorder.none,
                                              ),
                                              hintText:
                                                  "Busque uma localidade...",
                                              textStyle: context
                                                  .textStyles.textInterRegular
                                                  .copyWith(
                                                color: AppColors.lightPrimary,
                                                fontSize: 12,
                                              ),
                                              dropdownMenuEntries: cityEntries,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 0,
                              color: AppColors.lightHover,
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Divider(
                        height: 0,
                        color: AppColors.lightHover,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                // _clearSelection();
                              },
                              child: Text(
                                'Redefinir',
                                style: context.textStyles.textInterRegular
                                    .copyWith(
                                  fontSize: 15,
                                  color: AppColors.darker,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'Aplicar',
                                style: context.textStyles.textInterRegular
                                    .copyWith(
                                  fontSize: 15,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
