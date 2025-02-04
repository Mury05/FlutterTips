import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: Gallery()),
        SizedBox(
          height: 70,
        ),
        Container(child: Categories()),
      ],
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Categories",
        style: TextStyle(
          fontSize: 45,
          color: Colors.pink[400],
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class Gallery extends StatelessWidget {
  const Gallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            "Gallery",
            style: TextStyle(
              fontSize: 45,
              color: Colors.green[400],
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GalleryCard(icon: Icons.diamond_outlined, color: Color.fromARGB(255, 253, 236, 206), title: "Shrine", description: "A fashionable retail app !",),
            GalleryCard(icon: Icons.diamond_outlined, color:const Color.fromARGB(255, 255, 216, 220), title: "Shrine", description: "A fashionable retail app !",),
            GalleryCard(icon: Icons.diamond_outlined, color:const Color.fromARGB(255, 255, 249, 179), title: "Shrine", description: "A fashionable retail app !",),
            GalleryCard(icon: Icons.diamond_outlined, color:const Color.fromARGB(255, 227, 248, 227), title: "Shrine", description: "A fashionable retail app !",),
          ],
        )
      ],
    );
  }
}

class GalleryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color? color;

  const GalleryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 45),
            Spacer(),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}
