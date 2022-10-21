import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double result;
  final bool ismale;
  final int age;
  // ignore: non_constant_identifier_names
  String get Resultphrase {
    String resulttext = '';
    if (result >= 30) {
      resulttext =' Obese';
    } else if (result > 25 && result < 30) {
      resulttext ='Overweight';
    } else if (result > 18.5 && result <= 24.9) {
      resulttext ='Normal';
    } else {
      resulttext = 'Thin';
    }
    return resulttext;
  }

  const Result(
      {super.key,
      required this.result,
      required this.ismale,
      required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
      ),
      body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage('asset/wallpaperflare.com_wallpaper (5).jpg')),),
            child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Gender:${ismale ? 'Male' : 'Female'}',
                style: Theme.of(context).textTheme.headline1,
                
                textAlign: TextAlign.center,
              ),
              Text(
                'Healthness:$Resultphrase',
                 style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
                
              ), 
              Text(
                'Age:$age',
                 style: Theme.of(context).textTheme.headline1,
                
                textAlign: TextAlign.center,
              ),
              Text(
                'Result:${result.toStringAsFixed(1)}',
                 style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            
            ],
        ),
      ),
          )),
    );
  }
}
