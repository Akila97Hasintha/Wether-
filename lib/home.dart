import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'geoLocator.dart';
import 'wetherData.dart';

var dayInfo = DateTime.now();
var dateFomat = DateFormat('EEEE, d MMM , yyyy').format(dayInfo);
class Home extends StatelessWidget {
  //const Home({super.key});
  var client = WeatherData();
  var data;

  Home({super.key});

   info() async {
    var position =await getPosition();
    //data = await client.getData(position.latitude, position.longitude);
    data = await client.getData('6.521943200000001', '80.11368519999996');
    return data;

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
          body: FutureBuilder(
            future: info(),
            builder: ((context,snapshot) {
              return  Column(
                children: [
                  Container(
                    height: size.height*0.75,
                    width: size.width,
                    padding: const EdgeInsets.only(top:40),
                    margin: const EdgeInsets.only(right: 10,left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image:const DecorationImage(
                        image: AssetImage('assets/sunny-sky.png'),
                        fit: BoxFit.fill,
                      ),
                      // gradient: const LinearGradient(
                      //   colors: [
                      //     Color(0xff6a1b9a),
                      //     Color(0xff3fa2fa),
                      //   ],
                      //   begin:Alignment.bottomCenter,
                      //   end: Alignment.topCenter,
                      //   stops:[0.2 ,04],


                    ),
                    child: Column(
                      children: [
                        Text(
                          '${data?.cityName}',
                          style: TextStyle(
                            color: Colors.black45.withOpacity(.9),
                            fontSize: 35,
                            //fontFamily:
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          dateFomat,
                          style: TextStyle(
                            color: Colors.black45.withOpacity(.9),
                            fontSize: 15,
                            //fontFamily:
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Image.asset(
                        //   'assets/sun.png',
                        //   width: size.width *0.2,
                        // ),
                        Image.network(data?.icon ?? '',
                          width: size.width *0.2,
                          fit:BoxFit.fill,),
                        Text(
                          '${data?.condition}',
                          style: TextStyle(
                            color: Colors.black45.withOpacity(.9),
                            fontSize: 45,
                            //fontFamily:
                          ),
                        ),
                        Text(
                          '${data?.temp}º',
                          style: TextStyle(
                            color: Colors.black45.withOpacity(.9),
                            fontSize: 45,
                            //fontFamily:
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset('assets/R.png',width:size.width*0.15),
                                  Text(
                                    '${data?.wind} km/h',
                                    style: TextStyle(
                                      color: Colors.black45.withOpacity(.9),
                                      fontSize: 20,
                                      //fontFamily:
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Wind',
                                    style: TextStyle(
                                      color: Colors.black45.withOpacity(.9),
                                      fontSize: 17,
                                      //fontFamily:
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset('assets/weather.png',width:size.width*0.15),
                                  Text(
                                    '${data?.humidity}',
                                    style: TextStyle(
                                      color: Colors.black45.withOpacity(.9),
                                      fontSize: 20,
                                      //fontFamily:
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Humidity',
                                    style: TextStyle(
                                      color: Colors.black45.withOpacity(.9),
                                      fontSize: 17,
                                      //fontFamily:
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset('assets/R flag.png',width:size.width*0.15),
                                  Text(
                                    '${data?.wind_dir}',
                                    style: TextStyle(
                                      color: Colors.black45.withOpacity(.9),
                                      fontSize: 20,
                                      //fontFamily:
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'wind Direction',
                                    style: TextStyle(
                                      color: Colors.black45.withOpacity(.9),
                                      fontSize: 17,
                                      //fontFamily:
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Gust',
                              style: TextStyle(
                                color: Colors.black45.withOpacity(.9),
                                fontSize: 17,
                                //fontFamily:
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.gust}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.9),
                                fontSize: 23,
                                //fontFamily:
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Pressure',
                              style: TextStyle(
                                color: Colors.black45.withOpacity(.9),
                                fontSize: 17,
                                //fontFamily:
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.pressure}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.9),
                                fontSize: 23,
                                //fontFamily:
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'UV',
                              style: TextStyle(
                                color: Colors.black45.withOpacity(.9),
                                fontSize: 17,
                                //fontFamily:
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.uv}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.9),
                                fontSize: 23,
                                //fontFamily:
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'precipitation',
                              style: TextStyle(
                                color: Colors.black45.withOpacity(.9),
                                fontSize: 17,
                                //fontFamily:
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.pricipe}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.9),
                                fontSize: 23,
                                //fontFamily:
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Wind',
                              style: TextStyle(
                                color: Colors.black45.withOpacity(.9),
                                fontSize: 17,
                                //fontFamily:
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.wind}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.9),
                                fontSize: 23,
                                //fontFamily:
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Last Update',
                              style: TextStyle(
                                color: Colors.black45.withOpacity(.9),
                                fontSize: 17,
                                //fontFamily:
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data?.last_update}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.9),
                                fontSize: 18,
                                //fontFamily:
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              );
            }),
          )
    )
    );
  }
}
