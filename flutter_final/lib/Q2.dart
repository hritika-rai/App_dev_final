import 'dart:ui';

import 'package:flutter/material.dart';

class q2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 300,
      decoration: BoxDecoration(
        color: Color.fromARGB(221, 41, 41, 41),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 250),
          Row(
            children: [
              Container(
                // width: 130,
                // height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                   
                ),
              ),
              Container(
                height:50,
                width:50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius:0.5,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.apple, color: Colors.white, size:20 ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Analytic Data',
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    'Apple Officer',
                    style: TextStyle(color: Colors.grey, fontSize: 19),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.bookmark_added_rounded, color: Colors.white),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                // height: 20,
                // width: 100,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Full time',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Offline',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '1 year Exp',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Discover how you can make an impact: See our areas of work, worldwide locations, and opportunities for students.',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$250 / Month',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '1 Week Ago',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        child: IconButton(
                        icon: Icon(Icons.arrow_forward, color: Colors.white),
                        onPressed: () {},
                      ),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
  