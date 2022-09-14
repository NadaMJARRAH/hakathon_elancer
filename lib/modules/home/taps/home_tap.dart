import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakathon_elancer/get/courses_getx_controller.dart';
import 'package:hakathon_elancer/models/course.dart';
import 'package:hakathon_elancer/models/process_response.dart';
import 'package:hakathon_elancer/modules/admin/courese_detiles_admin.dart';
import 'package:hakathon_elancer/prefs/shared_pref_controller.dart';
import 'package:hakathon_elancer/utils/context_extenssion.dart';
import 'package:hakathon_elancer/widgets/dialog_text_feild.dart';
import 'package:hakathon_elancer/widgets/home_section.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TextEditingController _houreTextController;
  late TextEditingController _nameTextController;
  late TextEditingController _detailsTextController;
  late TextEditingController _linkTextController;
  late TextEditingController _teacherNameTextController;

  late TextEditingController _imageTextController;

  @override
  void initState() {
    super.initState();

    _houreTextController = TextEditingController();
    _detailsTextController = TextEditingController();
    _nameTextController = TextEditingController();
    _linkTextController = TextEditingController();
    _teacherNameTextController = TextEditingController();
    _imageTextController = TextEditingController();
  }

  @override
  void dispose() {
    _houreTextController.dispose();
    _detailsTextController.dispose();
    // _houreTextController.dispose();
    _linkTextController.dispose();
    _teacherNameTextController.dispose();
    _imageTextController.dispose();

    super.dispose();
  }

  final CoursesGetxController controller =
      Get.put<CoursesGetxController>(CoursesGetxController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesGetxController>(
      builder: (CoursesGetxController controller) {
        if (controller.courses.isNotEmpty) {
          return ListView.builder(
            itemCount: controller.courses.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 130),
                      child: GridView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                          // mainAxisExtent: 90,
                          childAspectRatio: 90 / 230,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: Container(
                              // color: Color(0xffffffff),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5, right: 5),
                                    child: Image.asset('images/company.png'),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'يوكاس',
                                          style: GoogleFonts.cairo(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          'كاتب محتوى',
                                          style: GoogleFonts.cairo(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'تفاصيل الإعلان',
                                      style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    HomeSection(title: 'تقارير', onPressed: () {}),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 300),
                      child: GridView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 250,
                          childAspectRatio: 150 / 190,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            child: Container(
                              // color: Color(0xffffffff),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // padding: const EdgeInsets.only(top: 5,bottom: 5,right: 5),

                                    Image.asset(
                                      'images/blog.png',
                                      height: 130,
                                      width: 250,
                                      fit: BoxFit.fill,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ' تقرير جديد ',
                                            style: GoogleFonts.cairo(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            'ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة',
                                            style: GoogleFonts.cairo(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    HomeSection(
                        title: 'دورات',
                        onPressed: () {
                          showAlertDialog(context);
                        }),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 320),
                      child: GridView.builder(
                        itemCount: controller.courses.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 280,
                          childAspectRatio: 180 / 200,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CoureseDetilesAdmin(
                                          course: controller.courses[index])));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                              child: Container(
                                // color: Color(0xffffffff),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          'images/blog.png',
                                          height: 130,
                                          width: double.infinity,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      // padding: const EdgeInsets.only(top: 5,bottom: 5,right: 5),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          controller.courses[index].name,
                                          style:
                                              GoogleFonts.cairo(fontSize: 14),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              controller
                                                  .courses[index].teacherName,
                                              style: GoogleFonts.cairo(
                                                  fontSize: 14),
                                            ),
                                            const Spacer(),
                                            Text(
                                              controller.courses[index].houreNum
                                                  .toString(),
                                              style: GoogleFonts.cairo(
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Text(
                                          controller.courses[index].info,
                                          style: GoogleFonts.cairo(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Text(
                                          'الرابط:',
                                          style: GoogleFonts.cairo(
                                              color: Colors.blue),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Text(
                                          controller.courses[index].path,
                                          style: GoogleFonts.cairo(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),

                                      // Image.asset(
                                      //   'images/blog.png',
                                      //   height: 130,
                                      //   width: 250,
                                      //   fit: BoxFit.fill,
                                      // ),
                                      // Padding(
                                      //   padding:
                                      //       EdgeInsets.symmetric(horizontal: 10),
                                      //   child: Row(
                                      //     children: [
                                      //       Text(
                                      //         controller.courses[index].name,
                                      //         style:
                                      //             GoogleFonts.cairo(fontSize: 14),
                                      //       ),
                                      //       Spacer(),
                                      //       Text(
                                      //         controller.courses[index].houreNum
                                      //             .toString(),
                                      //         style:
                                      //             GoogleFonts.cairo(fontSize: 14),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(right: 5),
                                      //   child: Text(
                                      //     controller.courses[index].info,
                                      //     style: GoogleFonts.cairo(
                                      //         fontSize: 10,
                                      //         fontWeight: FontWeight.w400),
                                      //   ),
                                      // ),
                                      // Text(
                                      //   'الرابط',
                                      //   style:
                                      //       GoogleFonts.cairo(color: Colors.blue),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(right: 5),
                                      //   child: Text(
                                      //     controller.courses[index].path,
                                      //     style: GoogleFonts.cairo(
                                      //         fontSize: 10,
                                      //         fontWeight: FontWeight.w400),
                                      //   ),
                                      // ),
                                    ]),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Center(
            child: Text(
              'NO DATA',
              style: GoogleFonts.cairo(
                fontSize: 24,
                color: Colors.black45,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
      },
    );
  }

  void showAlertDialog(BuildContext context) {
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
                    AppTextFiledHint(
                      controller: _nameTextController,
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
                    AppTextFiledHint(
                      controller: _houreTextController,
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
                    AppTextFiledHint(
                      controller: _teacherNameTextController,
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
                    AppTextFiledHint(
                      controller: _detailsTextController,
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
                    AppTextFiledHint(
                      controller: _linkTextController,
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
                    AppTextFiledHint(
                      controller: _imageTextController,
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
                    onPressed: () {
                      _performSave();
                    },
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

  void _performSave() {
    if (_checkData()) {
      _save();
    }
  }

  bool _checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _houreTextController.text.isNotEmpty &&
        _linkTextController.text.isNotEmpty &&
        _teacherNameTextController.text.isNotEmpty &&
        _imageTextController.text.isNotEmpty &&
        _detailsTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(
      message: 'ادخل البيانات المطلوبة',
      error: true,
    );
    return false;
  }

  Future<void> _save() async {
    ProcessResponse processResponse =
        await CoursesGetxController.to.create(course);
    // ignore: use_build_context_synchronously
    context.showSnackBar(
        message: processResponse.message, error: !processResponse.success);

    if (processResponse.success) {
      clear();
    }
  }

  Course get course {
    Course course = Course();
    course.name = _nameTextController.text;
    course.houreNum = int.parse(_houreTextController.text);
    course.teacherName = _teacherNameTextController.text;
    course.info = _detailsTextController.text;
    course.path = _linkTextController.text;
    course.image = _imageTextController.text;

    return course;
  }

  void clear() {
    _nameTextController.clear();
    _houreTextController.clear();
    _linkTextController.clear();
    _detailsTextController.clear();
    _teacherNameTextController.clear();
    _imageTextController.clear();
  }
}
