import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

final List listCategories = ["Work", "Figma", "School"];

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    final systemColor = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories",
          style: styleText.headline1,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            alignment: Alignment.center,
            splashRadius: 20,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              "assets/icons/Arrow_back.svg",
              color: systemColor.primaryColorLight,
            )),
      ),
      body: ListView.builder(
          itemCount: listCategories.length,
          itemBuilder: (context, index) => Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                height: 70,
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: systemColor.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      "${listCategories[index]}",
                      style: styleText.headline1!.copyWith(fontSize: 16),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => systemColor.primaryColorDark),
                        shape: MaterialStateProperty.resolveWith(
                          (states) => const CircleBorder(),
                        ),
                      ),
                      onPressed: () {},
                      child: SvgPicture.asset(
                        "assets/icons/Arrow_forward.svg",
                        color: Colors.white,
                        height: 16,
                        width: 16,
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}
