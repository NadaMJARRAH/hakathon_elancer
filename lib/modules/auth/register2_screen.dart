// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hakathon_elancer/models/experiance.dart';
// import 'package:hakathon_elancer/models/freelancer.dart';
// import 'package:hakathon_elancer/models/gender.dart';
// import 'package:hakathon_elancer/models/process_response.dart';
// import 'package:hakathon_elancer/utils/colors.dart';
// import 'package:hakathon_elancer/utils/context_extenssion.dart';
// import 'package:hakathon_elancer/utils/utility.dart';
// import 'package:hakathon_elancer/widgets/custom_button.dart';
// import 'package:hakathon_elancer/widgets/custom_text_feild.dart';
// import 'package:image_picker/image_picker.dart';



// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   String? imageName;
//   late TextEditingController _nameEditingController;
//   late TextEditingController _emailEditingController;
//   late TextEditingController _passwordEditingController;
//   late TextEditingController _mobileEditingController;
//   late TextEditingController _facebookEditingController;
//   late TextEditingController _linkedInEditingController;
//   late TextEditingController _twitterEditingController;
//   late TextEditingController _upworkEditingController;
//   late TextEditingController _freelanceEditingController;
//   late TextEditingController _mostaqelEditingController;
//   late TextEditingController _khamsatEditingController;
//   Widget? photo = const Icon(Icons.add_photo_alternate_outlined);
//   int? _selectedGenderId;
//   int? _selectedSpecialtyId;
//   int? _selectedExperienceId;
//   bool _obscure = true;
//   final List<Gender> _gender = <Gender>[
//     const Gender(id: 1, title: 'Male'),
//     const Gender(id: 2, title: 'FeMale'),
//   ];

//   final List<Experiance> _experiences = <Experiance>[
//      const Experiance(id: 1, title: 'Expert'),
//      const Experiance(id: 2, title: 'Advanced'),
//      const Experiance(id: 3, title: 'Intermediate '),
//      const Experiance(id: 4, title: 'Junior'),
//   ];

//   // late List<Specialty> _specialties = <Specialty>[];
//   @override
//   void initState(){
//     super.initState();
//     // Future.delayed(const Duration(seconds: 0),()async{
//     //   _specialties= await SpecialtiesDbController().read(0);
//     // });
//     _nameEditingController = TextEditingController();
//     _emailEditingController = TextEditingController();
//     _passwordEditingController = TextEditingController();
//     _mobileEditingController = TextEditingController();
//     _facebookEditingController = TextEditingController();
//     _linkedInEditingController = TextEditingController();
//     _twitterEditingController = TextEditingController();
//     _upworkEditingController = TextEditingController();
//     _freelanceEditingController = TextEditingController();
//     _mostaqelEditingController = TextEditingController();
//     _khamsatEditingController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _nameEditingController.dispose();
//     _emailEditingController.dispose();
//     _passwordEditingController.dispose();
//     _mobileEditingController.dispose();
//     _facebookEditingController.dispose();
//     _linkedInEditingController.dispose();
//     _twitterEditingController.dispose();
//     _upworkEditingController.dispose();
//     _freelanceEditingController.dispose();
//     _mostaqelEditingController.dispose();
//     _khamsatEditingController.dispose();
//     super.dispose();
//   }

//   void getSpecialty (){}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('sign in'),
//       ),
//       body: ListView(
//         padding: EdgeInsets.symmetric(horizontal: 16),
//         children: [
//           const SizedBox(height: 35),
//           const CircleAvatar(
//             radius: 45,
//             child: Image(image: AssetImage('images/profilePhot.png')),
//           ),
//           const SizedBox(height: 20),
//           AppTextField(
//             hint: 'Enter Your Name ',
//             keyboardType: TextInputType.text,
//             controller: _nameEditingController,
//           ),
//           SizedBox(height: 20),
//           AppTextField(
//               hint: 'Enter Your Email ',
//               keyboardType: TextInputType.emailAddress,
//               controller: _emailEditingController),
//           SizedBox(height: 20),
//           AppTextField(
//             hint: 'Enter Your Password',
//             keyboardType: TextInputType.text,
//             // obscure: _obscure,
//             controller: _passwordEditingController,
//             suffix: IconButton(
//               onPressed: () {
//                 setState(() => _obscure = !_obscure);
//               },
//               icon: Icon(
//                 _obscure ? Icons.visibility : Icons.visibility_off_outlined,
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           AppTextField(
//             hint: ' Mobile Number',
//             keyboardType: const TextInputType.numberWithOptions(
//               decimal: false,
//               signed: false,
//             ),
//             controller: _mobileEditingController,
//           ),
//           SizedBox(height: 20),
//           DecoratedBox(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black38, width: 1),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: DropdownButton<int>(
//                 hint: const Text('Choose your gender'),
//                 style: GoogleFonts.tajawal(color: Colors.black),
//                 icon: const Icon(Icons.keyboard_arrow_down),
//                 dropdownColor: const Color(0XFFFFFFFF),
//                 borderRadius: BorderRadius.circular(10),
//                 elevation: 5,
//                 underline: const Divider(
//                   color: Colors.white,
//                 ),
//                 isExpanded: true,
//                 value: _selectedGenderId,
//                 selectedItemBuilder: (BuildContext context) {
//                   return _selectedGenderId != null
//                       ? _gender
//                           .map(
//                             (element) => Align(
//                               alignment: AlignmentDirectional.centerStart,
//                               child: Text(
//                                 _gender
//                                     .firstWhere((element) =>
//                                         element.id == _selectedGenderId)
//                                     .title,
//                                 style: GoogleFonts.montserrat(
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           )
//                           .toList()
//                       : [];
//                 },
//                 onChanged: (int? value) {
//                   setState(() {
//                     _selectedGenderId = value;
//                   });
//                 },
//                 items: _gender.map((status) {
//                   return DropdownMenuItem<int>(
//                     value: status.id,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(status.title),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           DecoratedBox(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black38, width: 1),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: DropdownButton<int>(
//                 hint: const Text('Experience'),
//                 style: GoogleFonts.tajawal(color: Colors.black),
//                 icon: const Icon(Icons.keyboard_arrow_down),
//                 dropdownColor: const Color(0XFFFFFFFF),
//                 borderRadius: BorderRadius.circular(10),
//                 elevation: 5,
//                 underline: const Divider(
//                   color: Colors.white,
//                 ),
//                 isExpanded: true,
//                 value: _selectedExperienceId,
//                 selectedItemBuilder: (BuildContext context) {
//                   return _selectedExperienceId != null
//                       ? _experiences
//                           .map(
//                             (element) => Align(
//                               alignment: AlignmentDirectional.centerStart,
//                               child: Text(
//                                 _experiences
//                                     .firstWhere((element) =>
//                                         element.id == _selectedExperienceId)
//                                     .title,
//                                 style: GoogleFonts.montserrat(
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ),
//                           )
//                           .toList()
//                       : [];
//                 },
//                 onChanged: (int? value) {
//                   setState(() {
//                     _selectedExperienceId = value;
//                   });
//                 },
//                 items: _experiences.map((status) {
//                   return DropdownMenuItem<int>(
//                     value: status.id,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(status.title),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           DecoratedBox(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black38, width: 1),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: DropdownButton<int>(
//                 hint: const Text('Specialty'),
//                 style: GoogleFonts.tajawal(color: Colors.black),
//                 icon: const Icon(Icons.keyboard_arrow_down),
//                 dropdownColor: const Color(0XFFFFFFFF),
//                 borderRadius: BorderRadius.circular(10),
//                 elevation: 5,
//                 underline: const Divider(
//                   color: Colors.white,
//                 ),
//                 isExpanded: true,
//                 value: _selectedSpecialtyId,
//                 selectedItemBuilder: (BuildContext context) {
//                   return _selectedSpecialtyId != null
//                       ? _specialties
//                       .map(
//                         (element) => Align(
//                       alignment: AlignmentDirectional.centerStart,
//                       child: Text(
//                         _specialties
//                             .firstWhere((element) =>
//                         element.id == _selectedSpecialtyId)
//                             .title,
//                         style: GoogleFonts.montserrat(
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ),
//                   )
//                       .toList()
//                       : [];
//                 },
//                 onChanged: (int? value) {
//                   setState(() {
//                     _selectedSpecialtyId = value;
//                   });
//                 },
//                 items: _specialties.map((status) {
//                   return DropdownMenuItem<int>(
//                     value: status.id,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(status.title),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//           AppTextField(
//             hint: 'Facebook Link',
//             keyboardType: TextInputType.text,
//             controller: _facebookEditingController,
//           ),
//           const SizedBox(height: 20),
//           AppTextField(
//             hint: 'LinkedIn Link',
//             keyboardType: TextInputType.text,
//             controller: _linkedInEditingController,
//           ),
//           const SizedBox(height: 20),
//           AppTextField(
//             hint: 'Twitter Link',
//             keyboardType: TextInputType.text,
//             controller: _twitterEditingController,
//           ),
//           const SizedBox(height: 20),
//           AppTextField(
//             hint: 'Upwork Link',
//             keyboardType: TextInputType.text,
//             controller: _upworkEditingController,
//           ),
//           SizedBox(height: 20),
//           AppTextField(
//             hint: 'Freelancer Link',
//             keyboardType: TextInputType.text,
//             controller: _freelanceEditingController,
//           ),
//           SizedBox(height: 20),
//           AppTextField(
//             hint: 'Mostaqel Link',
//             keyboardType: TextInputType.text,
//             controller: _mostaqelEditingController,
//           ),
//           SizedBox(height: 20),
//           AppTextField(
//             hint: 'Khamsat Link',
//             keyboardType: TextInputType.text,
//             controller: _khamsatEditingController,
//           ),
//           SizedBox(height: 20),
//           Row(
//             children: [
//               InkWell(
//                 onTap: () async {
//                   await ImagePicker()
//                       .pickImage(source: ImageSource.gallery)
//                       .then((imgFile) async {
//                     String imgString =
//                         Utility.base64String(await imgFile!.readAsBytes());
//                     imageName = imgString;
//                   });
//                   setState(() {
//                     photo = getPhoto(imageName!);
//                   });
//                 },
//                 child: Container(
//                   height: 80,
//                   width: 80,
//                   decoration: BoxDecoration(
//                     color: const Color(0XFFD8D8D8),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: photo,
//                 ),
//               ),
//               const Spacer(),
//             ],
//           ),
//           SizedBox(height: 50),
//           CustomButton(
//               text: 'Sign up',
//               color: primaryColor,
//               onPress: () {
//                 // _performRegister();
//               }),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'You Have An Account?',
//                 style: GoogleFonts.poppins(
//                     fontWeight: FontWeight.w400, fontSize: 14),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(context, '/login_screen');
//                 },
//                 child: Text(
//                   ' Sign in',
//                   style: GoogleFonts.poppins(
//                       fontWeight: FontWeight.w700, fontSize: 14),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 10),
//         ],
//       ),
//     );
//   }

//   // void _performRegister() {
//   //   if (_checkData()) {
//   //     _register();
//   //   }
//   // }

//   // bool _checkData() {
//   //   if (_mobileEditingController.text.isNotEmpty &&
//   //       _passwordEditingController.text.isNotEmpty &&
//   //       _emailEditingController.text.isNotEmpty &&
//   //       _nameEditingController.text.isNotEmpty &&
//   //       _facebookEditingController.text.isNotEmpty &&
//   //       _linkedInEditingController.text.isNotEmpty &&
//   //       _twitterEditingController.text.isNotEmpty &&
//   //       _upworkEditingController.text.isNotEmpty &&
//   //       _freelanceEditingController.text.isNotEmpty &&
//   //       _mostaqelEditingController.text.isNotEmpty &&
//   //       _khamsatEditingController.text.isNotEmpty &&
//   //       _selectedGenderId != null &&
//   //       _selectedExperienceId != null) {
//   //     return true;
//   //   }
//   //   context.showSnackBar(
//   //     message: 'Please complete the required fields',
//   //     error: true,
//   //   );
//   //   return false;
//   // }

//   // void _register() async {
//   //   ProcessResponse rResponse = await FreelancersProvider().create(freelancer);
//   //   context.showSnackBar(message: rResponse.message, error: false);
//   //   // Navigator.pushReplacementNamed(context, '/admin_home_screen');
//   // }

//   // Freelancer get freelancer {
//   //   Freelancer freelancer = Freelancer();
//   //   freelancer.statusTitle = 'Reviewing';
//   //   freelancer.specialtiesTitle = _specialties[_selectedSpecialtyId!].title;
//   //   freelancer.name = _nameEditingController.text;
//   //   freelancer.email = _emailEditingController.text;
//   //   freelancer.password = _passwordEditingController.text;
//   //   freelancer.gender = _gender[_selectedGenderId! - 1].title;
//   //   freelancer.mobile = _mobileEditingController.text;
//   //   freelancer.image = imageName!;
//   //   freelancer.experience = _experiences[_selectedExperienceId!-1].title;
//   //   freelancer.facebook = _facebookEditingController.text;
//   //   freelancer.linkedIn = _linkedInEditingController.text;
//   //   freelancer.twitter = _twitterEditingController.text;
//   //   freelancer.upwork = _upworkEditingController.text;
//   //   freelancer.freelance = _freelanceEditingController.text;
//   //   freelancer.mostaqel = _mostaqelEditingController.text;
//   //   freelancer.khamsat = _khamsatEditingController.text;
//   //   return freelancer;
//   // }

//   Widget? getPhoto(String imageName) {
//     return Utility.imageFromBase64String(imageName);
//   }
// }
