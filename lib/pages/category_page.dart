import 'package:flutter/material.dart';
import 'package:future_jobs/providers/job_provider.dart';
import 'package:future_jobs/themes.dart';
import 'package:future_jobs/widgets/job_tile.dart';
import 'package:provider/provider.dart';

import '../models/category_model.dart';
import '../models/job_model.dart';

class CategoryPage extends StatelessWidget {
  
  CategoryModel category;

  CategoryPage({
    Key? key,
    required this.category
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);
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
                child: Image.network(
                  category.imageUrl!,
                  fit: BoxFit.cover,
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 190.0, left: 24),
              child: Text(
                category.name!,
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
             FutureBuilder<List<JobModel>>(
              future: jobProvider.getJobsbyCategory(category.name!),
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
            )
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
            )
            ],
          ),
        )
              ],
            ),
      ),
    );
  }
}
