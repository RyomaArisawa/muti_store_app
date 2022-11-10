import 'package:flutter/material.dart';

import '../widgets/appbar_widgets.dart';

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
        leading: const AppBarBackButton(),
        title: AppBarTitle(title: subCategoryName),
      ),
      body: Center(
        child: Text(mainCategoryName),
      ),
    );
  }
}
