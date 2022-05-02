import 'package:flutter/material.dart';
import 'package:future_jobs/themes.dart';
import 'package:future_jobs/widgets/custom_list.dart';

import '../widgets/job_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget Header() {
      return Container(
        padding:
            const EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 30),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Howdy',
                  style: greyTextColor.copyWith(fontSize: 16),
                ),
                Text(
                  'Jason Powell',
                  style: blackTextStyle.copyWith(
                      fontSize: 24, fontWeight: semiBold),
                )
              ],
            ),
            Spacer(),
            Image.asset(
              'assets/image_profile.png',
              width: 58,
            )
          ],
        ),
      );
    }

    Widget Body() {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hot Category',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    JobCard(
                      text: 'Website Developer',
                      imageUrl: 'assets/image_category1.png',
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    JobCard(
                      text: 'Mobile Developer',
                      imageUrl: 'assets/image_category2.png',
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    JobCard(
                      text: 'Website Developer',
                      imageUrl: 'assets/image_category3.png',
                    ),
                    const SizedBox(
                      width: 16,
                    ),JobCard(
                      text: 'App Designer',
                      imageUrl: 'assets/image_category4.png',
                    ),
                    const SizedBox(
                      width: 16,
                    ),JobCard(
                      text: 'Content Writer',
                      imageUrl: 'assets/image_category5.png',
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Just Posted',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
                ),
              ),
              SizedBox(
                height: 16,
              ),
              CustomList(
                jobTitle: 'Fron-End Developer', 
                company: 'Google', 
                imageUrl: 'assets/icon_google.png'
              ),
              SizedBox(
                height: 17,
              ),
              CustomList(
                jobTitle: 'UI Designer', 
                company: 'Instagram', 
                imageUrl: 'assets/icon_instagram.png'
              ),
              SizedBox(
                height: 17,
              ),
              CustomList(
                jobTitle: 'Data Scientist', 
                company: 'Facebook', 
                imageUrl: 'assets/icon_facebook.png'
              ),   
            ],      
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              Body(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(top: 20),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          unselectedItemColor: greyColor,
          currentIndex: 0,
          elevation: 0,
          iconSize: 20,
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: ImageIcon(
                AssetImage(
                  'assets/icon_home.png'
                )
              )
            ),
            BottomNavigationBarItem(
              label: '',
              icon: ImageIcon(
                AssetImage(
                  'assets/icon_notification.png'
                )
              )
            ),
            BottomNavigationBarItem(
              label: '',
              icon: ImageIcon(
                AssetImage(
                  'assets/icon_love.png'
                )
              )
            ),
            BottomNavigationBarItem(
              label: '',
              icon: ImageIcon(
                AssetImage(
                  'assets/icon_user.png'
                )
              )
            ),
          ],
        )
      ),
    );
  }
}
