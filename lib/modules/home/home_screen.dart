import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hakathon_elancer/modules/home/taps/freelancer_taps.dart';
import 'package:hakathon_elancer/modules/home/taps/home_tap.dart';
import 'package:hakathon_elancer/utils/colors.dart';

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
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
        ),
        title: Text(
          'Home',
          style: TextStyle(fontSize: 16),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.add_alert_sharp)),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
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
              padding: EdgeInsets.only(top: 10),
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
              children: [MainScreen(), FreelancerScreen()],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}
