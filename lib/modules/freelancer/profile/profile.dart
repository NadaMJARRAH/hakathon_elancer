import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hakathon_elancer/widgets/dialog_text_feild.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: Text(
          'الملف الشخصي',
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: 90,
              height: 90,
              margin: const EdgeInsetsDirectional.only(top: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
              ),
              child: Image.asset(
                'images/profile.png',
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 6,
              ),
              Text(
                'صهيب الجزار',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    height: 0),
              ),
              Text(
                'مبرمج Flutter',
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 0),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff0F62AC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(141, 30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.edit_outlined,
                      size: 16,
                      color: Colors.white70,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'عدّل ملفك الشخصي',
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Spacer(),
                  Image.asset('images/icon_1.png'),
                  const SizedBox(width: 10),
                  Image.asset('images/icon_2.png'),
                  const SizedBox(width: 10),
                  Image.asset('images/icon_3.png'),
                  const SizedBox(width: 10),
                  Image.asset('images/icon_4.png'),
                  const SizedBox(width: 10),
                  Image.asset('images/icon_5.png'),
                  const SizedBox(width: 10),
                  Image.asset('images/icon_6.png'),
                  const SizedBox(width: 10),
                  Image.asset('images/icon_7.png'),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Text(
                    'أعمالي',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 7,
                    mainAxisSpacing: 7,
                    mainAxisExtent: 163),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          height: 128,
                          width: 180,
                          imageUrl:
                              'https://www.iconfinder.com/static/img/meta-generic.png?d34117af5a',
                          imageBuilder: (context, imageProvider) => Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                  scale: 10),
                            ),
                          ),
                          placeholder: (context, url) => const Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            size: 30,
                            color: Colors.red.shade800,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 8),
                          child: Text(
                            'مبرمج Flutter',
                            style: GoogleFonts.poppins(),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 3,
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: const Color(0xffF5F5F5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff0F62AC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(161, 48),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.phone_outlined,
                          size: 16,
                          color: Colors.white70,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'تواصل مع المستقل',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffF58634),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(161, 48),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          size: 16,
                          color: Colors.white70,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'أرسل إيميل',
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 10, top: 5),
              child: FloatingActionButton(
                onPressed: () {
                  showAlertDialog2();
                },
                backgroundColor: const Color(0xff0F62AC),
                child: const Icon(
                  Icons.add,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: Center(
                child: Text(
                  'إضافة كورس',
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
              ),
              content: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 745,
                width: 343,
                child: ListView(
                  children: [
                    Text(
                      'اسم الكورس',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppTextFiledHint(
                      hintText: 'أدخل اسم الإعلان',
                      textInputType: TextInputType.text,
                    ),
                    Text(
                      'عدد الساعات',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppTextFiledHint(
                      hintText: '20 ساعة',
                      textInputType: TextInputType.datetime,
                    ),
                    Text(
                      'اسم المدرب',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppTextFiledHint(
                      hintText: 'أدخل اسم المدرب',
                      textInputType: TextInputType.text,
                    ),
                    Text(
                      'تفاصيل الكورس',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppTextFiledHint(
                      hintText: 'التفاصيل',
                      textInputType: TextInputType.multiline,
                      maxLength: 4,
                      height: 120,
                    ),
                    Text(
                      'رابط الكورس',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppTextFiledHint(
                      hintText: 'أدخل رابط الكورس',
                      textInputType: TextInputType.text,
                    ),
                    Text(
                      'صورة تعريفية الكورس',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppTextFiledHint(
                      hintText: '',
                      textInputType: TextInputType.text,
                      suffix: Icons.file_upload_outlined,
                    ),
                  ],
                ),
              ),
              actions: [
                SizedBox(
                  height: 48,
                  width: 322,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff0F62AC),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      'حفظ',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          });
        });
  }

  void showAlertDialog2() {
    showDialog(
        context: context,
        builder: (_) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: Center(
                child: Text(
                  'إضافة إعلان',
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
              ),
              content: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 745,
                width: 343,
                child: ListView(
                  children: [
                    Text(
                      'اسم الإعلان',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppTextFiledHint(
                      hintText: 'أدخل اسم الإعلان',
                      textInputType: TextInputType.text,
                    ),
                    Text(
                      'تاريخ البداية',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppTextFiledHint(
                      hintText: 'اختر تاريخ بداية الإعلان',
                      textInputType: TextInputType.datetime,
                      suffix: Icons.calendar_today_outlined,
                    ),
                    Text(
                      'وقت البداية',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppTextFiledHint(
                      hintText: 'اختر توقيت بداية الإعلان',
                      textInputType: TextInputType.text,
                      suffix: Icons.timer_outlined,
                    ),
                    Text(
                      'تفاصيل الإعلان',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppTextFiledHint(
                      hintText: 'التفاصيل',
                      textInputType: TextInputType.multiline,
                      maxLength: 4,
                      height: 120,
                    ),
                    Text(
                      'الموقع',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppTextFiledHint(
                      hintText: 'أدخل موقعك',
                      textInputType: TextInputType.text,
                    ),
                    Text(
                      'اسم الشركة',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppTextFiledHint(
                      hintText: 'أدخل اسم الشركة',
                      textInputType: TextInputType.text,
                    ),
                    Text(
                      'رابط موقع الشركة',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppTextFiledHint(
                      hintText: '',
                      textInputType: TextInputType.text,
                    ),
                    Text(
                      'صورة الإعلان',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const AppTextFiledHint(
                      hintText: 'أدخل اسم الشركة',
                      textInputType: TextInputType.text,
                      suffix: Icons.file_upload_outlined,
                    ),
                  ],
                ),
              ),
              actions: [
                SizedBox(
                  height: 48,
                  width: 322,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff0F62AC),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      'حفظ',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          });
        });
  }
}
