import 'package:flutter/material.dart';

class SubCategoryProducts extends StatelessWidget {
  final String mainCategoryName;
  final String subCategoryName;

  const SubCategoryProducts({Key? key, required this.mainCategoryName, required this.subCategoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          subCategoryName,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text(mainCategoryName),
      ),
    );
  }
}
