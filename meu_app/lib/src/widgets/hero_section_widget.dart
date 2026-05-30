import 'package:flutter/material.dart';

class HeroSectionWidget extends StatelessWidget {
  const HeroSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/store_bg.png'),
          fit: .cover,
        ),
      ),
      child: Column(
        spacing: 20,
        crossAxisAlignment: .center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset('assets/home_scroll.png', width: 500),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF780BF7),
              padding: .symmetric(horizontal: 30, vertical: 25),
            ),
            child: Text(
              'Ver as Novidades',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: .bold,
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
