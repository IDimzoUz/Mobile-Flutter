import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class PublicOfferPage extends StatefulWidget {
  const PublicOfferPage({Key? key}) : super(key: key);

  @override
  State<PublicOfferPage> createState() => _PublicOfferPageState();
}

class _PublicOfferPageState extends State<PublicOfferPage> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ПУБЛИЧНАЯ ОФЕРТА',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
    );
  }
}
