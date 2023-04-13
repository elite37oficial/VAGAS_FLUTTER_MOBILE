import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/helpers/size_extensions.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/app_colors.dart';
import 'package:vagas_flutter_mobile/src/features/core/ui/styles/text_styles.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<bool> _isSelected = [false, false, false, false, false];
  final List<String> cityNames = [
    'Rio de Janeiro/RN - BR',
    'São Paulo/SP - BR',
    'Parnaíba/PI - BR',
    'Garanhuns/PE - BR',
    'Jacuturu/PR - BR'
  ];

  void _toggleSelection(int index) {
    setState(() {
      _isSelected[index] = !_isSelected[index]; // negação
    });
  }

  void _clearSelection() {
    setState(() {
      _isSelected = List.generate(_isSelected.length, (index) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            // Aplicar de acordo com o context
            width: 300,
            height: 679,
            // width: context.percentWidth(300 / 430),
            // height: context.percentHeight(679 / 932),
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
                          vertical: 17,
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
                        height: 0,
                        color: AppColors.grey500,
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //! Tipo de Contrato
                            titleTypeFilterDrawer('Tipo de contrato'),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Row(
                                children: [
                                  customCheckBoxButton(0, 'CLT'),
                                  SizedBox(
                                    width: 24,
                                  ),
                                  customCheckBoxButton(
                                      1, 'PJ (Pessoa Jurídica)'),
                                ],
                              ),
                            ),
                            Divider(
                              height: 0,
                              color: AppColors.grey500,
                              thickness: 1,
                            ),
                            //! Modalidade
                            titleTypeFilterDrawer('Modalidade'),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      customCheckBoxButton(2, 'Remoto'),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      customCheckBoxButton(3, 'Presencial'),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  customCheckBoxButton(4, 'Hibrido')
                                ],
                              ),
                            ),
                            Divider(
                              height: 0,
                              color: AppColors.grey500,
                              thickness: 1,
                            ),
                            //! Localização
                            titleTypeFilterDrawer('Localização'),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                                left: 20,
                                right: 20,
                              ),
                              child: DropdownMenu(
                                leadingIcon: Icon(
                                  Icons.location_city, // location_on
                                  color: AppColors.primary,
                                ),
                                label: Text('Busque uma localidade',
                                    style: context.textStyles.textInterRegular
                                        .copyWith(
                                      color: AppColors.lightPrimary,
                                      fontSize: 12,
                                    )),
                                dropdownMenuEntries: cityEntries,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 12.0,
                                //bottom: 16,
                              ),
                              child: Divider(
                                height: 0,
                                color: AppColors.grey500,
                                thickness: 1,
                              ),
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
                                _clearSelection();
                              },
                              child: Text(
                                'Redefinir',
                                style: context.textStyles.textInterRegular
                                    .copyWith(
                                  fontSize: 15,
                                  color: AppColors.primary,
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

  Widget titleTypeFilterDrawer(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24.0,
        bottom: 16,
      ),
      child: Text(
        text,
        style: context.textStyles.textFilter.copyWith(
          fontSize: 16,
          color: AppColors.darker,
        ),
      ),
    );
  }

  Widget customCheckBoxButton(int index, String text) {
    return GestureDetector(
      onTap: () => _toggleSelection(index),
      child: Row(
        children: [
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: _isSelected[index] ? AppColors.active : null,
              border: Border.all(
                width: 1,
                color: AppColors.darker,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: _isSelected[index]
                ? Icon(
                    Icons.check,
                    weight: 8,
                    size: 15,
                    color: Colors.white,
                  )
                : null,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
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
