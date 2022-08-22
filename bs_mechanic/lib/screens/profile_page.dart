import 'dart:async';
import 'dart:io';
import 'package:bs_mechanic/components/cards.dart';
import 'package:bs_mechanic/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double height(BuildContext context) => MediaQuery.of(context).size.height;
  double width(BuildContext context) => MediaQuery.of(context).size.width;

  final TextEditingController _namecontroller =
      TextEditingController(text: 'Jeya Singh');
  final TextEditingController _locationcontroller =
      TextEditingController(text: '33/11, Kauvery Nager, Saidapet');
  final TextEditingController _bikecontroller =
      TextEditingController(text: 'Hero Splender');

  bool isEditable = false;

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  final List<dynamic> data = [
    {
      'ccNumber': '1111 1111 1111 1111',
      'expDate': '12/27',
      'cvv': '123',
      'ccHolderName': 'xxx'
    },
    {
      'ccNumber': '2222 2222 2222 2222',
      'expDate': '12/27',
      'cvv': '123',
      'ccHolderName': 'yyy'
    },
    {
      'ccNumber': '3333 3333 3333 3333',
      'expDate': '12/27',
      'cvv': '123',
      'ccHolderName': 'zzz'
    },
    {
      'ccNumber': '1111 1111 1111 1111',
      'expDate': '12/27',
      'cvv': '123',
      'ccHolderName': 'xxx'
    },
    {
      'ccNumber': '2222 2222 2222 2222',
      'expDate': '12/27',
      'cvv': '123',
      'ccHolderName': 'yyy'
    },
    {
      'ccNumber': '3333 3333 3333 3333',
      'expDate': '12/27',
      'cvv': '123',
      'ccHolderName': 'zzz'
    },
    {
      'ccNumber': '1111 1111 1111 1111',
      'expDate': '12/27',
      'cvv': '123',
      'ccHolderName': 'xxx'
    },
    {
      'ccNumber': '2222 2222 2222 2222',
      'expDate': '12/27',
      'cvv': '123',
      'ccHolderName': 'yyy'
    },
    {
      'ccNumber': '3333 3333 3333 3333',
      'expDate': '12/27',
      'cvv': '123',
      'ccHolderName': 'zzz'
    },
    {
      'ccNumber': '1111 1111 1111 1111',
      'expDate': '12/27',
      'cvv': '123',
      'ccHolderName': 'xxx'
    },
    {
      'ccNumber': '2222 2222 2222 2222',
      'expDate': '12/27',
      'cvv': '123',
      'ccHolderName': 'yyy'
    },
    {
      'ccNumber': '3333 3333 3333 3333',
      'expDate': '12/27',
      'cvv': '123',
      'ccHolderName': 'zzz'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.1),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: textBlack,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.bell),
                  color: iconColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: textBlack,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: textBlack,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: (image != null)
                      ? CircleAvatar(
                          backgroundImage: FileImage(image!),
                          backgroundColor: lightGrey,
                          radius: 80,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Material(
                                  child: IconButton(
                                    onPressed: () => pickImage(),
                                    icon: const FaIcon(FontAwesomeIcons.pen),
                                    color: textWhite,
                                    iconSize: 16,
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  shape: const CircleBorder(),
                                  color: orange,
                                  elevation: 5,
                                ),
                              ),
                            ],
                          ),
                        )
                      : CircleAvatar(
                          backgroundImage:
                              const AssetImage('assets/images/avatar.png'),
                          backgroundColor: lightGrey,
                          radius: 80,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Material(
                                  child: IconButton(
                                    onPressed: () => pickImage(),
                                    icon: const FaIcon(FontAwesomeIcons.pen),
                                    color: textWhite,
                                    iconSize: 16,
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  shape: const CircleBorder(),
                                  color: orange,
                                  elevation: 5,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: height(context) * 0.05),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width(context) * 0.6,
                  child: TextField(
                    controller: _namecontroller,
                    enabled: isEditable,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textBlack,
                    ),
                  ),
                ),
                IconButton(
                  iconSize: 16,
                  onPressed: () {
                    setState(() {
                      isEditable = true;
                    });
                  },
                  icon: const FaIcon(FontAwesomeIcons.pen),
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: grey,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width(context) * 0.6,
                  child: TextField(
                    controller: _locationcontroller,
                    enabled: isEditable,
                    decoration: const InputDecoration(
                      labelText: 'Location',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textBlack,
                    ),
                  ),
                ),
                IconButton(
                  iconSize: 16,
                  onPressed: () {
                    setState(() {
                      isEditable = true;
                    });
                  },
                  icon: const FaIcon(FontAwesomeIcons.pen),
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: grey,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width(context) * 0.6,
                  child: TextField(
                    controller: _bikecontroller,
                    enabled: isEditable,
                    decoration: const InputDecoration(
                      labelText: 'Carrying Bike',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textBlack,
                    ),
                  ),
                ),
                IconButton(
                  iconSize: 16,
                  onPressed: () {
                    setState(() {
                      isEditable = true;
                    });
                  },
                  icon: const FaIcon(FontAwesomeIcons.pen),
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: grey,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height(context) * 0.03),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Payment Methods',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: iconColor,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: height(context) * 0.01),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: width(context) * 0.8,
                  height: 25,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: grey,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Saved Cards',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: textBlack,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data[i]["ccNumber"],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: CardsWidget(),
                                ),
                              );
                            },
                          );
                        },
                        icon: const FaIcon(
                          FontAwesomeIcons.pen,
                          size: 16,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
