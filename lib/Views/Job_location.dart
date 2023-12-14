import 'package:flutter/material.dart';
import 'package:phaino_assignment/Constants/constants.dart';
import 'package:searchfield/searchfield.dart';

class Job_Location_Page extends StatefulWidget {
  const Job_Location_Page({super.key});

  @override
  State<Job_Location_Page> createState() => _Job_Location_PageState();
}

class _Job_Location_PageState extends State<Job_Location_Page> {
  @override
  String jobloc="";
  String jobar="";
  Map? job;
  TextEditingController joblocaton=TextEditingController();
  TextEditingController jobarea=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_outlined)),
        title: jobloc.isEmpty?Text("Enter Job City"):Text("Enter Nearest Landmark")
        ),

      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            children: [
              SearchField(
                controller: joblocaton,
                onSaved: (v){
                  print(v.toString());
                },
                onSuggestionTap: (value){
                  setState(() {
                    jobloc=value.searchKey.toString();
                  });
                },              
                searchInputDecoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: secondary,)
                                ),
                        
                            focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: secondary,)
                                ),
                            labelText: "Enter City",
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search)
                          ),
              
              
                suggestions: ['Thane', 'Mulund', 'Nahur', 'Bhandup' , 'Kalyan','Cst']
                                .map((e) => SearchFieldListItem(e, child: Text(e)))
                                .toList(),
                ),
                SizedBox(height: 20,),
                Visibility(
                  visible:jobloc.isNotEmpty,
                  child: SearchField(
                controller: jobarea,
                onSuggestionTap: (value){
                  setState(() {
                    jobar=value.searchKey.toString();
                  });
                },              
                searchInputDecoration: InputDecoration(
                  
                            enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: secondary,)
                                ),
                        
                            focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: secondary,)
                                ),
                             
                            hintText: "Enter Landmark/Bus Stand /Railway",
                            prefixIcon: Icon(Icons.search)
                          ),
              
              
                suggestions: ['Street 1', 'Mulund Station', 'Nahur Bus depot', 'Road 22' , 'Shivaji Park','Highway mall']
                                .map((e) => SearchFieldListItem(e, child: Text(e)))
                                .toList(),
                ),
                  )
            ],
          ),
      ),
      

      bottomNavigationBar: InkWell(
        onTap: (){
          final data = { "key1" : jobloc.toString(), "key2" : jobar.toString() };
          Navigator.pop(context,data);
        },
        child: Container(
          width: double.infinity,
          height: 50,
          color: secondary,
          child: Center(child: Text("OK"),),
        ),
      ),
       
    );
    
  }
}