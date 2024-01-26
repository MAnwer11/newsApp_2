// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

Widget buildArticleItem(article) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    //image: AssetImage('assets/photos/anwar.jpg'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      maxLines: 3,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

Widget myDivider() => const Padding(
      padding: EdgeInsets.all(15.0),
      child: Divider(
        color: Colors.grey,
        height: 2.0,
        thickness: 1,
      ),
    );
