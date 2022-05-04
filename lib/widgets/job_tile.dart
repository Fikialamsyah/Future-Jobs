import 'dart:io';

import 'package:flutter/material.dart';
import 'package:future_jobs/pages/detail_page.dart';
import '../themes.dart';

class JobTile extends StatelessWidget {
  final String? name;
  final String? companyName;
  final String? companyLogo;

  JobTile({
    this.name,
    this.companyName,
    this.companyLogo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Image.network(
            companyLogo!,
            width: 44,
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  companyName!,
                  style: greyTextStyle,
                ),
                const SizedBox(
                  height: 18,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}