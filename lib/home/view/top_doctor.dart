import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_bloc/home/Presenter/home_bloc.dart';
import 'package:medical_bloc/home/Presenter/home_status.dart';
import 'package:medical_bloc/main.dart';
import 'package:medical_bloc/utils/custom/textCustam.dart';
import 'package:medical_bloc/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopDoctors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            7.h.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new)),
                Textcustam(
                  text: 'Top Doctor',
                  size: 18,
                  weight: FontWeight.w600,
                ),
                const Icon(Icons.linear_scale_outlined)
              ],
            ),
            6.h.height,
            Expanded(
                child: BlocBuilder<HomeBloc, HomeStatus>(
              builder: (context, state) => ListView.builder(
                itemCount: state.TopDoctor.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 125,
                    margin: const EdgeInsets.only(bottom: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Color(0xffE8F3F1))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 125,
                            width: 105,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                        state.TopDoctor[index].doctorImage),
                                    fit: BoxFit.cover)),
                          ),
                          3.w.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              1.h.height,
                              Textcustam(
                                text: 'Dr. Marcus Horizon',
                                size: 12,
                                weight: FontWeight.w600,
                              ),
                              Textcustam(
                                text: 'Chardiologist',
                                col: Colors.grey,
                                size: 9,
                              ),
                              2.h.height,
                              Container(
                                height: 20,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(255, 217, 248, 245)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.star_outlined,
                                      size: 15,
                                      color: appcolour,
                                    ),
                                    Textcustam(
                                      text: '  4,7',
                                      size: 10,
                                      col: appcolour,
                                    )
                                  ],
                                ),
                              ),
                              8.height,
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.grey,
                                    size: 15,
                                  ),
                                  Textcustam(
                                    text: '800m away',
                                    size: 9,
                                    col: Colors.grey,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
