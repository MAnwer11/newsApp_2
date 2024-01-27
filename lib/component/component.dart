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
                    image: article['urlToImage'] != null
                        ? NetworkImage('${article['urlToImage']}')
                        : const NetworkImage(
                            'https://images.unsplash.com/photo-1554080353-a576cf803bda?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGhvdG98ZW58MHx8MHx8fDA%3D'),
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
