import 'package:flutter/material.dart';
import 'package:future_jobs/models/category_model.dart';
import 'package:future_jobs/models/job_model.dart';
import 'package:future_jobs/themes.dart';
import 'package:future_jobs/widgets/job_tile.dart';
import 'package:provider/provider.dart';
import '../providers/category_provider.dart';
import '../providers/job_provider.dart';
import '../providers/user_provider.dart';
import '../widgets/category_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

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
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
                Text(
                  userProvider.user?.name ?? '',
                  style: blackTextStyle.copyWith(
                      fontSize: 24, fontWeight: semiBold),
                )
              ],
            ),
            const Spacer(),
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
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 200,
              child: FutureBuilder<List<CategoryModel>>(
                future: categoryProvider.getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView(
                        scrollDirection: Axis.horizontal,
                        children: snapshot.data!.map((category) {
                          int index = -1;

                          return Container(
                              margin: EdgeInsets.only(
                                  left: index == 0 ? defaultMargin : 0),
                              child: CategoryCard(
                                  category: category,));
                        }).toList());
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Just Posted',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 16,
            ),
            FutureBuilder<List<JobModel>>(
              future: jobProvider.getJobs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: snapshot.data!
                        .map((job) => JobTile(
                              job: job,
                            ))
                        .toList(),
                  );
                }
                 return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ));
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
                  icon: ImageIcon(AssetImage('assets/icon_home.png'))),
              BottomNavigationBarItem(
                  label: '',
                  icon: ImageIcon(AssetImage('assets/icon_notification.png'))),
              BottomNavigationBarItem(
                  label: '',
                  icon: ImageIcon(AssetImage('assets/icon_love.png'))),
              BottomNavigationBarItem(
                  label: '',
                  icon: ImageIcon(AssetImage('assets/icon_user.png'))),
            ],
          )),
    );
  }
}
