import 'package:flutter/material.dart';
import 'package:whether_app/models/weather_model.dart';
import 'package:whether_app/servise/dio_helper.dart';
import 'Weather_Screan.dart';

class Search extends StatelessWidget{
var controller = TextEditingController();
Wheather_Model? wheather_model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller:controller ,
              onFieldSubmitted: (text){
                GetWheather(country:text);
              },
              decoration: InputDecoration(
                suffix: Icon(Icons.search),
                 label: Text('search'),
                // hintText: 'search',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 200,
              child: MaterialButton(
                height: 50,
                onPressed: ()async{

                 await GetWheather(country: controller.text);
                 Future.delayed(Duration(seconds: 1) ,()=>Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => Wheather_Screan(wheather_model: wheather_model,),
                     )));
                },
                color: Colors.blue,
                child: Text('Search',
                style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> GetWheather(
      {required String country}
      )async {
    Dio_Helper.GetData(url: 'data/2.5/weather?q=$country&appid=a755acb0916dfb843140ccbfabed3596&units=metric')
        .then((value) {
          wheather_model =Wheather_Model.fromJson(value.data);
          print(wheather_model?.name);
    }).catchError((error){
      print(error);
    });
    
  }
}
