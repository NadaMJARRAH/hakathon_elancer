import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakathon_elancer/get/courses_getx_controller.dart';
import 'package:hakathon_elancer/models/course.dart';
import 'package:hakathon_elancer/widgets/app_text_button.dart';

class CoureseDetilesAdmin extends StatefulWidget {
  CoureseDetilesAdmin({Key? key, required this.course}) : super(key: key);

  final Course course;

  @override
  State<CoureseDetilesAdmin> createState() => _CoureseDetilesAdminState();
}

class _CoureseDetilesAdminState extends State<CoureseDetilesAdmin> {
  @override
  void initState() {
    super.initState();
    CoursesGetxController.to.show(widget.course.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'تفاصيل الكورس',
          style: GoogleFonts.cairo(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'images/blog.png',
                    fit: BoxFit.fill,
                    height: 200,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'مبادئ تصميم تجربةوواجهة المستخدم',
                      style: GoogleFonts.cairo(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text(
                          'احمد حواري',
                          style: GoogleFonts.cairo(fontSize: 14),
                        ),
                        const Spacer(),
                        Text(
                          '40 ساعة',
                          style: GoogleFonts.cairo(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'في دورة تصميم تجربة المستخدم المجانية من ادراك',
                      style: GoogleFonts.cairo(
                          fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'الرابط:',
                      style: GoogleFonts.cairo(color: Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'https://www.edraak.org/programs/specialization/uiux-v1/',
                      style: GoogleFonts.cairo(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: Row(
                  //     children: [
                  //       Image.asset(
                  //         'images/profile.png',
                  //         height: 35,
                  //         width: 35,
                  //       ),
                  //       Text(
                  //         ' براءة تربان ',
                  //         style: GoogleFonts.cairo(fontSize: 14),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         ' براءة تربان ',
                  //         style: GoogleFonts.cairo(
                  //             fontSize: 12, fontWeight: FontWeight.w700),
                  //       ),
                  //       const Spacer(),
                  //       const Text('30h')
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 10, vertical: 10),
                  //   child: Text(
                  //     'ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة',
                  //     style: GoogleFonts.cairo(
                  //         fontSize: 10, fontWeight: FontWeight.w400),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8),
                  //   child: Text(
                  //     'رابط الكورس',
                  //     style: GoogleFonts.cairo(color: Colors.blue),
                  //   ),
                  // ),
                  // const Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8),
                  //   child: const Text(
                  //     'http:\\',
                  //   ),
                  // )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Spacer(),
                AppTextButton(
                  text: 'تعديل',
                  onPressed: () {},
                  width: 140,
                  backgroundColor: const Color(0xff005959),
                ),
                const Spacer(),
                AppTextButton(
                  text: 'حذف',
                  onPressed: () {},
                  width: 140,
                  backgroundColor: const Color(0xffCD1905),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
