import 'package:flutter/material.dart';
import 'package:future_jobs/themes.dart';

import '../pages/second_homepage.dart';

class JobCard extends StatelessWidget {
  final String text;
  final String imageUrl;

  const JobCard({
    Key? key,
    required this.text,
    required this.imageUrl
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SecondHomePage(jobTitleHome: text, imageUrl: imageUrl,)));
      },
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imageUrl
            )
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, bottom: 15),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              text,
              style: whiteTextColor.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}