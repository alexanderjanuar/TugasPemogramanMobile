import 'package:flutter/material.dart';

class Course {
  final String title;
  final String name;
  final String duration;
  final String lesson;
  final String difficulty;
  final String description;
  final String takeAwaySkill;
  final String picture;
  final List<String> syllables;
  int index = 0;
  bool isLiked = false;

  Course(
      this.title,
      this.name,
      this.picture,
      this.duration,
      this.lesson,
      this.difficulty,
      this.description,
      this.takeAwaySkill,
      this.syllables,
      this.isLiked,
      this.index);
}
