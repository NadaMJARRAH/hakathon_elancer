import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FreelancerScreen extends StatelessWidget {
  const FreelancerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              // color: Color(0xffffffff),
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
                    child: Image.asset(
                      'images/free.png',
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'براءة تربان',
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      Text(
                        'مبرمج فلاتر',
                        style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'الصفحة الشخصية',
                      style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500, fontSize: 10),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
