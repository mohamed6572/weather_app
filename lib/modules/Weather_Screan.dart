import 'package:flutter/material.dart';
import 'package:whether_app/models/weather_model.dart';

class Wheather_Screan extends StatelessWidget {
  Wheather_Model? wheather_model;

  Wheather_Screan({required this.wheather_model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Weather app',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            getThemeColor(),
            getThemeColor()[300]!,
            getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          children: [
            Image(
              image: NetworkImage(
                  'https://openweathermap.org/img/wn/${wheather_model?.weather![0].icon}.png'),
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
            Text(
              '${wheather_model?.weather![0].main}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '${wheather_model?.main?.temp} °C',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'max ${wheather_model?.main?.tempMax} %',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  'min ${wheather_model?.main?.tempMin} %',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '${wheather_model?.name}',
              style: TextStyle(color: Colors.grey, fontSize: 27),
            ),
            Text(
              '${wheather_model?.weather![0].description}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Additional Information',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'wind:\t\t ${wheather_model?.wind?.speed} km/h',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  'Humidity:\t\t ${wheather_model?.main?.humidity} %',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Feels Like:\t\t ${wheather_model?.main?.feelsLike} °C',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  'pressure:\t\t ${wheather_model?.main?.pressure} "Hg',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  MaterialColor getThemeColor() {
    if (wheather_model?.weather![0].main == 'Clear' ||
        wheather_model?.weather![0].main == 'Light Cloud') {
      return Colors.orange;
    } else if (wheather_model?.weather![0].main == 'Sleet' ||
        wheather_model?.weather![0].main == 'Snow' ||
        wheather_model?.weather![0].main == 'Hail') {
      return Colors.blue;
    } else if (wheather_model?.weather![0].main == 'Heavy Cloud'||wheather_model?.weather![0].main == 'Clouds' ) {
      return Colors.blueGrey;
    } else if (wheather_model?.weather![0].main == 'Light Rain' ||
        wheather_model?.weather![0].main == 'Heavy Rain' ||
        wheather_model?.weather![0].main == 'Showers	') {
      return Colors.blue;
    } else if (wheather_model?.weather![0].main == 'Thunderstorm' ||
        wheather_model?.weather![0].main == 'Thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
