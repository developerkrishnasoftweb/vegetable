import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vegetable/constant/colors.dart';

GridView categoryBuilder({@required List<CategoryItems> items, double childAspectRatio}){
  if(items != null)
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: childAspectRatio ?? 0.9,
          mainAxisSpacing: 15,
          crossAxisSpacing: 10
      ),
      itemBuilder: (BuildContext context, int index){
        return InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: items[index].onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colours.categoryBorderColor, width: 2),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Image(
                  image: items[index].image,
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                child: Text(items[index].title,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14),
                ),
              )
            ],
          ),
        );
      },
      itemCount: items.length ?? 0,
    );
  else return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 0),);
}

class CategoryItems{
  final String id, categoryId;
  final ImageProvider image;
  final String title;
  final GestureTapCallback onTap;
  final String homeScreen;
  CategoryItems({this.image, this.title, this.onTap, this.id, this.homeScreen, this.categoryId});
}