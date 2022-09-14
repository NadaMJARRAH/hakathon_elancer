import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakathon_elancer/modules/home/taps/freelancer_taps.dart';
import 'package:hakathon_elancer/modules/home/taps/home_tap.dart';
import 'package:hakathon_elancer/utils/colors.dart';
import 'package:hakathon_elancer/widgets/dialog_text_feild.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        title: Text(
          'الشاشة الرئيسة',
          style: GoogleFonts.cairo(fontWeight: FontWeight.w700, fontSize: 15),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.add_alert_sharp)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBar(
              // isScrollable: true,
              indicatorWeight: 2,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.zero,
              indicator: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              labelColor: Colors.white,
              labelStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelColor: primaryColor,
              unselectedLabelStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              padding: const EdgeInsets.only(top: 10),
              controller: _tabController,
              tabs: const [
                Tab(
                  text: 'الشاشة الرئيسية',
                ),
                Tab(text: 'صاحب المهارة'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [const MainScreen(), const FreelancerScreen()],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
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
