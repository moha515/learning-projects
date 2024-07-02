import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(Busines());
}

class Busines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff232F3F),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Image.asset(
                    'assets/images/alphabet-letters-initials-monogram-logo-fv-vf-f-and-v-free-vector.jpg',
                    width: 250,
                  ),
                  borderRadius: BorderRadius.circular(999),
                ),
                Text(
                  "Moha Elfandi",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Edu NSW ACT Foundation'),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                      color: Color.fromARGB(255, 93, 123, 147),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Divider(
                  color: Color(0xff232F3F),
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    height: 65,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.phone,
                            size: 32,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '(+218)  925156539',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        Spacer(
                          flex: 3,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    height: 65,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.email,
                            size: 32,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Elfandi70@gmail.com',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                        Spacer(
                          flex: 3,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
