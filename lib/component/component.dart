import 'package:flutter/material.dart';

Widget buildArticleItem() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                image: const DecorationImage(
                    image: AssetImage('assets/photos/anwer.jpg'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'title',
                      maxLines: 4,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    '2024-01-22',
                    style: TextStyle(color: Colors.grey),
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
