import 'package:flutter/material.dart';
import 'package:phaino_assignment/Constants/constants.dart';

Widget Input_Field(
  String label,
){
  return Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.person,color: secondary,size: 30,),
                      focusColor: secondary,
                      labelText: label,
          
                     enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: secondary,)
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: secondary,)
                      ),
                  ),
                ),
              );
}