import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/talabatlogo.png"),
              radius: 30,
            ),
            Column(
              children: [
                Text("Hello"),
                Text("Amira Nasser"),
              ],
            )
          ],
        ),
        Card(
          child: Row(
            children: [
              const Text(
                "Talabat",
                style: TextStyle(
                  color: Color(0xFFFF5A00),
                  fontSize: 30,
                  fontFamily: "font talabat",
                ),
              ),
              IconButton(
                color: Colors.black,
                isSelected: true,
                iconSize: 25,
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFFF5A00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.search),
              )
            ],
          ),
        )
      ],
    );
  }
}
