import 'package:flutter/material.dart';
import 'package:phaino_assignment/Constants/constants.dart';
import 'package:phaino_assignment/Views/Job_location.dart';
import 'package:phaino_assignment/Views/category.dart';
import 'package:phaino_assignment/Widgets/Input_field.dart';
import 'package:searchfield/searchfield.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Map nav=new Map();
  String? gender;
  List gender_list=['Male','Female'];
  TextEditingController _date=TextEditingController();
  TextEditingController jobloc=TextEditingController();
  TextEditingController jobar=TextEditingController();
  Future<void> _selectdate() async{
    var _picked_date=await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), 
      lastDate: DateTime(2100));

      if(_picked_date!=null){
        _date.text= _picked_date.toString().split(" ")[0];
      }
  }

  Widget build(BuildContext context) {
    
    return  Scaffold(
        appBar: AppBar(
          leading: Container(
            child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: secondary,)),
          ),
        ),
      
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text("Let's create your\nProfile",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
          
              Container(
                padding: EdgeInsets.all(10),
                child: Image.asset("assets/img.png",),
              ),
         
              Input_Field("Full Name"),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: TextField(
                  cursorColor: Colors.grey,
                  readOnly: true,
                  controller: _date,
                  onTap: (){_selectdate();},
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.date_range_rounded,color: secondary,size: 30,),
                      focusColor: secondary,
                      labelText: 'Date of Birth',
          
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
              ),


              Container(
                margin: EdgeInsets.symmetric(horizontal: 10,),
                padding: EdgeInsets.only(left: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: secondary)
                ),
                child: DropdownButton(
                  hint: Text("Choose Gender"),
                  
                  isExpanded: true,
                  iconSize: 40,
                  iconDisabledColor: secondary,
                  iconEnabledColor: secondary,
                  value: gender,
                  onChanged: (newvalue){
                    setState(() {
                      gender=newvalue.toString();
                    });
                  },
                
                  items: gender_list.map((value){
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value.toString())
                      );
                  }).toList(),
                  ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: TextField(
                  controller: jobloc,
                       decoration: InputDecoration(
                        suffixIcon: Icon(Icons.business_sharp,color: secondary,),
                          labelText: "Job City",
                          enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: secondary,)
                        ),
                
                    focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: secondary,)
                        ),
                  ),
                  onTap: ()async{
                    nav=await  Navigator.push(context, MaterialPageRoute(builder: (context)=>Job_Location_Page()));
                    setState(() {
                      jobloc.text=nav["key1"].toString();
                      jobar.text=nav["key2"].toString();
                    });
                    print(nav);
                  },
           
                  ),
              ),


               nav.isNotEmpty?
               Container(
                margin: EdgeInsets.symmetric(horizontal: 10,),
                child: TextField(
                  controller: jobar,
                       decoration: InputDecoration(
                          suffixIcon: Icon(Icons.local_attraction_outlined,color: secondary,),
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
                ):Container(),
              
             
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryPage())),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                width: double.infinity,
                height: 40,
               
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: secondary
                ),
                child: Center(child: Text("Next"),),
              
              ),
            )
            ],
          ),
        ),
      );
    
  }
}