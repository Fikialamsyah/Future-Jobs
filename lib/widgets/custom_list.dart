import 'package:flutter/material.dart';
import 'package:future_jobs/themes.dart';

class CustomList extends StatelessWidget {
  final String jobTitle;
  final String company;
  final String imageUrl;
  
  const CustomList({
    Key? key,
    required this.jobTitle,
    required this.company,
    required this.imageUrl
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 45,
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jobTitle,
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16
                ),
              ),
              Text(
                company,
                style: greyTextColor.copyWith(
                  fontWeight: medium,
                  fontSize: 16
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Divider(
                color: greyColor, thickness: 1,
              )
            ],
          ),
        )
      ],
    );
  }
}