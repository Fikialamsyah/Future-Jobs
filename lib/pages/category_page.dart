import 'package:flutter/material.dart';
import 'package:future_jobs/themes.dart';
import 'package:future_jobs/widgets/job_tile.dart';

class CategoryPage extends StatelessWidget {
  final String? name;
  final String? imageUrl;

  const CategoryPage({
    Key? key,
    this.name,
    this.imageUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)
              ),
              child: Container(
                width: double.infinity,
                height: 290,
                child: Image.asset(
                  imageUrl!,
                  fit: BoxFit.cover,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 190.0, left: 24),
              child: Text(
                name!,
                style:
                    whiteTextStyle.copyWith(fontSize: 24, fontWeight: bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 230, left: 24,),
              child: Text(
                '12, 309 available',
                style:
                    whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Big Companies',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
             JobTile(
                name: 'Front-End Developer', 
                companyName: 'Google', 
                companyLogo: 'assets/icon_google.png'
              ),
              const SizedBox(
                height: 17,
              ),
             JobTile(
                name: 'UI Designer', 
                companyName: 'Instagram', 
                companyLogo: 'assets/icon_instagram.png'
              ),
              const SizedBox(
                height: 17,
              ),
             JobTile(
                name: 'Data Scientist', 
                companyName: 'Facebook', 
                companyLogo: 'assets/icon_facebook.png'
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              Text(
                'New Startups',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              JobTile(
                name: 'Front-End Developer', 
                companyName: 'Google', 
                companyLogo: 'assets/icon_google.png'
              ),
              const SizedBox(
                height: 17,
              ),
              JobTile(
                name: 'UI Designer', 
                companyName: 'Instagram', 
                companyLogo: 'assets/icon_instagram.png'
              ),
              const SizedBox(
                height: 17,
              ),
              JobTile(
                name: 'Data Scientist', 
                companyName: 'Facebook', 
                companyLogo: 'assets/icon_facebook.png'
              ),
            ],
          ),
        )
              ],
            ),
      ),
    );
  }
}
