import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:mohamed_ali/core/core.dart';
import 'package:mohamed_ali/configs/configs.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  int currentPage = 0;
  final int numPages = 10;

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
        numPages,
        (index) => Material(
              borderRadius: BorderRadius.circular(
                AppDimensions.normalize(3),
              ),
              elevation: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.normalize(3),
                  ),
                ),
                child: Column(
                  children: [
                    Space.y!,
                    Container(
                      padding: Space.all(1.2, .7),
                      margin: Space.all(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          AppDimensions.normalize(7),
                        ),
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Country",
                            style: AppText.custom,
                          ),
                          Text(
                            "Capital",
                            style: AppText.custom,
                          ),
                        ],
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: AppStrings.arabicCountriesAndCapitals.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: Space.vf(.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                AppStrings.arabicCountriesAndCapitals[index]
                                        ["Country"]
                                    .toString(),
                                style: AppText.b2,
                              ),
                              Text(
                                AppStrings.arabicCountriesAndCapitals[index]
                                        ["Capital"]
                                    .toString(),
                                style: AppText.b2,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Colors.grey.shade300,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ));
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(
          top: AppDimensions.normalize(
            17,
          ),
        ),
        child: Padding(
          padding: Space.hf(1.2),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Countries",
                  style: AppText.h3b,
                ),
              ),
              Space.yf(1.5),
              pages[currentPage],
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: Space.hf(1.2),
        child: Container(
          margin: EdgeInsets.only(
            bottom: AppDimensions.normalize(25),
          ),
          child: NumberPaginator(
            numberPages: numPages,
            onPageChange: (int index) {
              setState(() {
                currentPage = index;
              });
            },
            initialPage: 0,
            config: NumberPaginatorUIConfig(
              buttonTextStyle: AppText.b1,
              height: AppDimensions.normalize(17),
              buttonPadding: const EdgeInsets.all(0),
              buttonShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  AppDimensions.normalize(
                    5,
                  ),
                ),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              buttonSelectedForegroundColor: Colors.white,
              buttonUnselectedForegroundColor: Colors.black,
              buttonUnselectedBackgroundColor: Colors.white,
              buttonSelectedBackgroundColor: Colors.green.shade300,
            ),
          ),
        ),
      ),
    );
  }
}
