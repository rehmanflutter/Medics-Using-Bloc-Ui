import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_bloc/Online_Pharmacy/presenter/arcticles_block.dart';
import 'package:medical_bloc/Online_Pharmacy/presenter/arcticles_event.dart';
import 'package:medical_bloc/Online_Pharmacy/presenter/arcticles_status.dart';
import 'package:medical_bloc/main.dart';
import 'package:medical_bloc/utils/custom/textCustam.dart';
import 'package:medical_bloc/utils/custom/textFiled.dart';
import 'package:medical_bloc/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Arcticles extends StatelessWidget {
  List Popular_Articles = ['Covid-19', 'Diet', 'Fitness'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColour,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              7.h.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // GestureDetector(
                  //     onTap: () {
                  //       Navigator.pop(context);
                  //     },
                  //     child: const Icon(Icons.arrow_back_ios_new)),
                  SizedBox(),
                  Textcustam(
                    text: 'Arcticles',
                    size: 18,
                    weight: FontWeight.w600,
                  ),
                  const Icon(Icons.linear_scale_outlined)
                ],
              ),
              3.h.height,
              FadeInDown(
                child: Textfiledcustam(
                    height: 1,
                    hinttext: 'Search articles, news...',
                    starticon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(Images.Search),
                    )),
              ),
              3.h.height,
              Align(
                alignment: Alignment.topLeft,
                child: Textcustam(
                  text: 'Popular Articles',
                  size: 16,
                  weight: FontWeight.w600,
                ),
              ),
              2.h.height,
              FadeInLeft(
                  child: SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/PharmacyScreen');
                      },
                      child: Container(
                        height: 40,
                        width: 110,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: appcolour,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Textcustam(
                            text: Popular_Articles[index],
                            size: 14,
                            weight: FontWeight.w600,
                            col: whiteColour,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )),
              2.h.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Textcustam(
                    text: 'Trending Articles',
                    size: 16,
                    weight: FontWeight.w600,
                  ),
                  Textcustam(
                    text: 'See all',
                    col: appcolour,
                  )
                ],
              ),
              3.h.height,
              FadeInRight(
                child: SizedBox(
                    height: 240,
                    child: BlocBuilder<ArcticlesBlock, ArcticlesStatus>(
                      builder: (context, state) => ListView.builder(
                        itemCount: state.TrendingArticles.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final article = state.TrendingArticles[index];
                          final isSaved = state.SavedArticles.contains(article);
                          return Container(
                            height: 219,
                            width: 159,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffE8F3F1),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(state
                                                .TrendingArticles[index]
                                                .images),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            context.read<ArcticlesBlock>().add(
                                                SaveArticle(article: article));
                                          },
                                          child: SvgPicture.asset(
                                            Images.Bookmark,
                                            height: 20,
                                            color: isSaved
                                                ? Colors.yellow
                                                : Colors
                                                    .white, // Change color based on save status
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  7.height,
                                  Container(
                                      height: 20,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Color.fromARGB(
                                              255, 217, 248, 245)),
                                      child: Center(
                                        child: Textcustam(
                                          text: 'Covid-19'.toString(),
                                          size: 10,
                                          col: appcolour,
                                        ),
                                      )),
                                  7.height,
                                  SizedBox(
                                    width: 130,
                                    child: Textcustam(
                                      text: state.TrendingArticles[index].title,
                                      size: 12,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  5.height,
                                  Row(
                                    children: [
                                      Textcustam(
                                        text:
                                            state.TrendingArticles[index].date,
                                        col: Colors.grey,
                                        size: 10,
                                      ),
                                      Textcustam(
                                        text:
                                            '    ${state.TrendingArticles[index].read}',
                                        size: 10,
                                        col: appcolour,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
