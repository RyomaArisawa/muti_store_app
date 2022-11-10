import 'package:flutter/material.dart';
import 'package:multi_store_app/categories/accessories_cagtegory.dart';
import 'package:multi_store_app/categories/bags_category.dart';
import 'package:multi_store_app/categories/beauty_category.dart';
import 'package:multi_store_app/categories/electronics_category.dart';
import 'package:multi_store_app/categories/home_garden_category.dart';
import 'package:multi_store_app/categories/kids_category.dart';
import 'package:multi_store_app/categories/men_category.dart';
import 'package:multi_store_app/categories/shoes_category.dart';
import 'package:multi_store_app/categories/women_category.dart';
import 'package:multi_store_app/widgets/fake_search.dart';

List<ItemData> items = [
  ItemData(label: 'men'),
  ItemData(label: 'women'),
  ItemData(label: 'shoes'),
  ItemData(label: 'bags'),
  ItemData(label: 'electronics'),
  ItemData(label: 'accessories'),
  ItemData(label: 'home & garden'),
  ItemData(label: 'kids'),
  ItemData(label: 'beauty'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _pageController = PageController();

  @override
  void initState() {
    for (var item in items) {
      item.isSelected = false;
    }
    setState(() {
      items[0].isSelected = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const FakeSearch(),
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: sideNav(size),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: categoryView(size),
          ),
        ],
      ),
    );
  }

  Widget sideNav(Size size) {
    return SizedBox(
      width: size.width * 0.2,
      height: size.height * 0.8,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          child: Container(
            height: 100,
            color: items[index].isSelected ? Colors.white : Colors.grey.shade300,
            child: Center(
              child: Text(items[index].label),
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryView(Size size) {
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          for (var item in items) {
            item.isSelected = false;
          }
          setState(() {
            items[index].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: const [
          MenCategory(),
          WomenCategory(),
          ShoesCategory(),
          BagsCategory(),
          ElectronicsCategory(),
          AccessoriesCategory(),
          HomeGardenCategory(),
          KidsCategory(),
          BeautyCategory(),
        ],
      ),
    );
  }
}

class ItemData {
  String label;
  bool isSelected;

  ItemData({required this.label, this.isSelected = false});
}
