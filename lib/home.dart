import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Myhomepage extends StatefulWidget {
  const Myhomepage({Key? key}) : super(key: key);

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  bool ismale = true;
  double heightval = 175;
  int weight = 55;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Mass Index"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return const AlertDialog(
                      title: Text("How to know your BMI"),
                      content: SizedBox(
                        height: 400,
                        width: 300,
                        child: Text(
                          "Below 18.5: Underweight *** '18.5–24.9: Healthy Weight'*** '25.0–29.9: Overweight' ***'30.0 and Aboe: Obesity'",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  }));
            },
            icon: const Icon(Icons.info),
          )
        ],
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  gender(context, 'male'),
                  const SizedBox(
                    width: 20,
                  ),
                  gender(context, 'female'),
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.teal,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        heightval.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('CM',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Slider(
                      activeColor: Colors.deepPurple[200],
                      inactiveColor: Colors.black,
                      min: 90,
                      max: 220,
                      value: heightval,
                      onChanged: ((value) {
                        setState(() {
                          heightval = value;
                        });
                      }))
                ],
              ),
            ),
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  g(context, 'weight'),
                  const SizedBox(
                    width: 20,
                  ),
                  g(context, 'age'),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.teal,
            ),
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 12,
            child: TextButton(
                onPressed: (() {
                  var result = weight / pow(heightval / 100, 2);
          
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) =>
                          Result(result: result, ismale: ismale, age: age))));
                }),
                child: Text(
                  "Calculate",
                  style: Theme.of(context).textTheme.headline1,
                )),
          )
        ],
      )),
    );
  }

  Expanded gender(BuildContext context, String gender) {
    return Expanded(
      child: GestureDetector(
        onTap: (() {
          setState(() {
            ismale = gender == 'male' ? true : false;
          });
        }),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ismale == true && gender == 'male' ||
                      !ismale && gender == 'female'
                  ? Colors.teal
                  : Colors.blueGrey),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                gender == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                gender == 'male' ? 'Male' : 'female',
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded g(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.blueGrey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'age' : 'weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 20),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        type == 'age' ? age++ : weight++;
                      });
                    },
                    mini: true,
                    heroTag: type == 'age' ? 'age+' : 'weight+',
                    child: const Icon(Icons.add)),
                const SizedBox(
                  width: 8,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                  mini: true,
                  heroTag: type == 'age' ? 'age-' : 'weight-',
                  child: const Icon(Icons.remove),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
//KARIM NASSER

}
