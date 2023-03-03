import 'package:flutter/material.dart';

class VagasCard extends StatelessWidget {
  VagasCard(
      {super.key,
      required this.jobOportunity,
      required this.company,
      required this.path,
      required this.jobType,
      required this.value,
      required this.city});

  String jobOportunity;
  String company;
  String city;
  String jobType;
  String value;
  String path;

  @override
  Widget build(BuildContext context) {
    Size medida = MediaQuery.of(context).size;
    return SizedBox(
      height: medida.height * 0.10,
      width: medida.width * 0.8,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: Color(0xffE4EDF2),
          ),
        ),
        child: Row(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                height: 48,
                width: 48,
                child: Image.asset(
                  path,
                  height: 48,
                  width: 48,
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jobOportunity,
                style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                company,
                style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  Text(
                    "$city - ",
                    style: const TextStyle(
                        color: Color(0xFF545D69),
                        fontFamily: 'Inter',
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "$jobType - ",
                    style: const TextStyle(
                        color: Color(0xFF545D69),
                        fontFamily: 'Inter',
                        fontSize: 9,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "R\$ $value",
                    style: const TextStyle(
                        color: Color(0xff023E73),
                        fontFamily: 'Inter',
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
