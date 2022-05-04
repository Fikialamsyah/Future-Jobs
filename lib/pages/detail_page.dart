import 'package:flutter/material.dart';
import 'package:future_jobs/themes.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  bool isApplied = false;

  @override
  Widget build(BuildContext context) {

    Widget SuccessAppliedMessages() {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 30),
            width: 312,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xffECEDF1),
              borderRadius: BorderRadius.circular(49)
            ),
            child: Text(
                'You have applied this job and the\nrecruiter will contact you',
                style: greyTextStyle,
                textAlign: TextAlign.center,
            )
          ),
      );
      }

    Widget Header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isApplied ? SuccessAppliedMessages() : const SizedBox(),
          Center(
              child: Image.asset(
            'assets/icon_google.png',
            width: 58,
            height: 60,
          )),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Front-End Developer',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
          Text(
            'Google, Inc • Jakarta',
            style: greyTextStyle,
          ),
        ],
      );
    }

    Widget Body() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About the job',
            style: blackTextStyle.copyWith(fontWeight: semiBold),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Image.asset(
                'assets/dot.png',
                width: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Full-Time On Site',
                style: blackTextStyle.copyWith(fontWeight: light),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Image.asset(
                'assets/dot.png',
                width: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Start at \$18,000 per month',
                style: blackTextStyle.copyWith(fontWeight: light),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Qualifications',
            style: blackTextStyle.copyWith(fontWeight: semiBold),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Image.asset(
                'assets/dot.png',
                width: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Candidate must possess at least a\nBachelor\'s Degree.',
                style: blackTextStyle.copyWith(fontWeight: light),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Image.asset(
                'assets/dot.png',
                width: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Able to use Microsoft Office and Google\nbased service.',
                style: blackTextStyle.copyWith(fontWeight: light),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Image.asset(
                'assets/dot.png',
                width: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Have an excellent time management,\ngood at organized and details',
                style: blackTextStyle.copyWith(fontWeight: light),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Responsibilities',
            style: blackTextStyle.copyWith(fontWeight: semiBold),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Image.asset(
                'assets/dot.png',
                width: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Initiate and promote any programs, events,\ntraining, or activities.',
                style: blackTextStyle.copyWith(fontWeight: light),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Image.asset(
                'assets/dot.png',
                width: 12,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Assessing and anticipating needs and\ncollaborate with Division.',
                style: blackTextStyle.copyWith(fontWeight: light),
              )
            ],
          ),
        ],
      );
    }

    Widget ApplyButton() {
      return Column(
        children: [
          Center(
            child: Container(
              width: 200,
              height: 45,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      print(isApplied);
                      isApplied = !isApplied;
                    });
                  },
                  child: Text(
                    'Apply For Job',
                    style: whiteTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(66)))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Message Recruiter',
              style: greyTextStyle,
            ),
          )
        ],
      );
    }

    Widget CancelButton() {
      return Column(
        children: [
          Center(
            child: Container(
              width: 200,
              height: 45,
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      print(isApplied);
                      isApplied = !isApplied;
                    });
                  },
                  child: Text(
                    'Cancel Apply',
                    style: whiteTextStyle.copyWith(fontWeight: semiBold),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: redColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(66)))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Message Recruiter',
              style: greyTextStyle,
            ),
          )
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 82, bottom: 30, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              const SizedBox(
                height: 30,
              ),
              Body(),
              const SizedBox(
                height: 50,
              ),
              isApplied ? CancelButton() : ApplyButton()
            ],
          ),
        ),
      ),
    );
  }
}
