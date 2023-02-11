import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

imageWidget(
    {required String url,
    required double height,
    required double width,
    required double radius}) {
  return CachedNetworkImage(
    memCacheWidth: 500,
    memCacheHeight: 500,
    maxHeightDiskCache: 500,
    maxWidthDiskCache: 500,
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    ),
    placeholder: (context, url) => Container(
      height: height,
      width: width,
      
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.8),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
    ),
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}

listCard(
    {required String url,
    required Size size,
    required String title,
    required String description}) {
  return Container(
    decoration: BoxDecoration(
        border: Border(
            top: BorderSide(width: 1, color: Colors.grey.withOpacity(0.7)))),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        imageWidget(
            url: url,
            height: size.width * 0.2,
            width: size.width * 0.2,
            radius: 1000),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 15),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5,
              ),
              imageWidget(
                  url: url, height: 150, width: double.infinity, radius: 20)
            ],
          ),
        )
      ],
    ),
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
  );
}

