import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakathon_elancer/widgets/app_text_button.dart';

class CoureseDetilesAdmin extends StatelessWidget {
  const CoureseDetilesAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'تفاصيل الكورس',
          style: GoogleFonts.cairo(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
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
                    height: 154,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/prof.png',
                          height: 35,
                          width: 35,
                        ),
                        Text(
                          ' براءة تربان ',
                          style: GoogleFonts.cairo(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text(
                          ' براءة تربان ',
                          style: GoogleFonts.cairo(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        const Text('30h')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(
                      'ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة',
                      style: GoogleFonts.cairo(
                          fontSize: 10, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'رابط الكورس',
                      style: GoogleFonts.cairo(color: Colors.blue),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const Text(
                      'http:\\',
                    ),
                  )
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
