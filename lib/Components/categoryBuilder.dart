import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

GridView categoryBuilder({@required List<CategoryItems> items}){
  if(items != null)
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 10
      ),
      itemBuilder: (BuildContext context, int index){
        return InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: (){},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 67,
                width: 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFf7c5c5), width: 2),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Image(
                  image: items[index].image,
                  height: 40,
                  width: 40,
                  fit: BoxFit.fill,
                ),
              ),
              Text(items[index].title,
                style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14,),
              )
            ],
          ),
        );
      },
      itemCount: items.length,
    );
  else {
    return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 0),);
  }
}

class CategoryItems{
  final ImageProvider image;
  final String title;
  CategoryItems({this.image, this.title});
}