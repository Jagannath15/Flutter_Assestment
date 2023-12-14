import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
              ),
              Expanded(
                child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.amber,
                child: Column(
                  children: [
                    Text("Choose your category"),
                    Text("You have to choose atleast one category")
                  ],
                )
              ) 
              )
            ],
          ),
        )
    );
  }
}