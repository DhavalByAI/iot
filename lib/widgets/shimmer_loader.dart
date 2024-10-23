import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerLoader() {
  const Color baseColor = Color(0XFF141415);
  const Color highlightColor = Color(0XFF363a40);

    return GridView.builder(
    padding: const EdgeInsets.only(top:30, left:12, right:10, bottom:25),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount:2, mainAxisSpacing:15,
      crossAxisSpacing:15, childAspectRatio:1,
    ),
    itemCount:10, itemBuilder: (context, index) {
      return Container(
        padding:const EdgeInsets.symmetric(vertical:20, horizontal:10),
        decoration: BoxDecoration(
          color:highlightColor.withOpacity(0.5), borderRadius:BorderRadius.circular(15)
        ),
        child: Shimmer.fromColors(
          period:const Duration(milliseconds:700), 
          baseColor:highlightColor, highlightColor:baseColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(backgroundColor:Colors.white54),
                  CircleAvatar(radius:15, backgroundColor:Colors.white38),
                ],
              ),
              const SizedBox(height:5),
              Container(
                height:10, width:100,
                decoration: BoxDecoration(
                 color: Colors.white38, borderRadius:BorderRadius.circular(100)
                )
              ),
              const SizedBox(height:5),
              Container(
                height:28, width:50,
                decoration: BoxDecoration(
                 color: Colors.white38, borderRadius:BorderRadius.circular(100)
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
