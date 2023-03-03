import 'package:flutter/material.dart';
import 'package:vagas_flutter_mobile/models/job_model.dart';

class CardWidget extends StatelessWidget {
  final JobModel job;
  const CardWidget({
    Key? key,
    required this.job,
  }) : super(key: key);

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
                  job.imageUrl,
                  height: 48,
                  width: 48,
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                job.jobOportunity,
                style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                job.company,
                style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  Text(
                    "${job.city} - ",
                    style: const TextStyle(
                        color: Color(0xFF545D69),
                        fontFamily: 'Inter',
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "${job.jobType} - ",
                    style: const TextStyle(
                        color: Color(0xFF545D69),
                        fontFamily: 'Inter',
                        fontSize: 9,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "R\$ ${job.value}",
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
