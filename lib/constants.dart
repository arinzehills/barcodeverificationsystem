import 'package:flutter/material.dart';

const  appId="0282cdbc-0b53-4f12-b9c9-4762e3ebedc2";
final iconsColor=Color(int.parse("0xffffffff"));
var textFieldDecoration = InputDecoration(
                              
                                   hintText: 'Enter your matric no',
                                   hintStyle: TextStyle(color: Colors.grey[600]),
                                  filled: true,
                                  fillColor:  Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(50.0),
                                 ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                    ), 
);