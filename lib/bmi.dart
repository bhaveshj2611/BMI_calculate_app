import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  var bmiCalc = false;
  var result = "";
  var result2 = "";

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff050b21),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 80),
          const Text('BMI CALCULATOR',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 60),
          const Text('Height',
              style: TextStyle(color: Colors.white, fontSize: 24)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: TextField(
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
                keyboardType: TextInputType.number,
                controller: heightController,
                decoration: const InputDecoration(
                  suffixText: "cm",
                  contentPadding: EdgeInsets.all(10),
                  fillColor: Color(0xff514982),
                  filled: true,
                  hintText: 'Enter your height (cm)',
                  hintStyle: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 173, 173, 173)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Text('Weight',
              style: TextStyle(color: Colors.white, fontSize: 24)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: TextField(
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
                keyboardType: TextInputType.number,
                controller: weightController,
                decoration: const InputDecoration(
                  focusColor: Colors.white,
                  contentPadding: EdgeInsets.all(10),
                  suffixText: "kg",
                  fillColor: Color(0xff514982),
                  filled: true,
                  hintText: 'Enter your weight (kg)',
                  hintStyle: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 173, 173, 173)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {
              var cm = heightController.text;
              var kg = weightController.text;
              if (cm != "" && kg != "") {
                var intCm = int.parse(cm);
                var intKg = int.parse(kg);
                var meter = intCm / 100;
                var res = intKg / (meter * meter);
                var bmi = res.toStringAsFixed(2);
                setState(() {
                  result = "Your BMI is $bmi";
                });
                if (res > 25) {
                  setState(() {
                    result2 = "Overweight";
                  });
                } else if (res < 25 && res > 18) {
                  setState(() {
                    result2 = "Normal";
                  });
                } else {
                  setState(() {
                    result2 = "Underweight";
                  });
                }
              } else {
                setState(() {
                  result = "Fill all details";
                });
              }

              setState(() {
                bmiCalc = true;
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffe93757),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 72, vertical: 16),
              child: Text('CALCULATE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 40),
          bmiCalc
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 72, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xff514982),
                  ),
                  child: Text(result,
                      style:
                          const TextStyle(fontSize: 24, color: Colors.white)),
                )
              : Container(),
          const SizedBox(height: 8),
          Text(result2,
              style: const TextStyle(fontSize: 16, color: Colors.white)),
        ]),
      ),
    );
  }
}
