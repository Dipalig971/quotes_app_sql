import 'dart:ui';

import 'package:flutter/material.dart';

class Category {
  final String name;
  final Color color;
  final IconData icon;

  Category({required this.name, required this.color, required this.icon});
}

final List<Category> categories = [
   Category(name: 'Motivation', color: const Color(0xffB4EDFE), icon: Icons.mood),
   Category(name: 'Inspiration', color: const Color(0xffC2F7B9), icon: Icons.star),
   Category(name: 'Love', color: const Color(0xffFFEBA4), icon: Icons.favorite),
   Category(name: 'For photos', color: const Color(0xffDDCCFF), icon: Icons.photo),
   Category(name: 'Reflection', color: const Color(0xffB4EDFE), icon: Icons.self_improvement),
   Category(name: 'Messages of encouragement', color:const Color(0xffC2F7B9), icon: Icons.link),
   Category(name: 'For status', color: const Color(0xffFFEBA4), icon: Icons.phone_android),
   Category(name: 'Anxiety', color:  const Color(0xffDDCCFF), icon: Icons.directions_run),
  Category(name: 'Bible', color:const Color(0xffB4EDFE), icon: Icons.church),
  Category(name: 'Business', color: const Color(0xffC2F7B9), icon: Icons.business),
  Category(name: 'Overcoming', color: const Color(0xffFFEBA4), icon: Icons.emoji_events),
  Category(name: 'Positivity', color: const Color(0xffDDCCFF), icon: Icons.psychology),
  Category(name: 'Depression', color: const Color(0xffB4EDFE), icon: Icons.volunteer_activism),
  Category(name: 'Good morning', color: const Color(0xffC2F7B9), icon: Icons.wb_sunny),
  Category(name: 'Self esteem', color: const Color(0xffFFEBA4), icon: Icons.person_search),
  Category(name: 'Short quotes', color: const Color(0xffDDCCFF), icon: Icons.short_text),
  Category(name: 'Move on', color: const Color(0xffB4EDFE), icon: Icons.memory),
];