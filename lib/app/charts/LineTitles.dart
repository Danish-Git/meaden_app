import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
    show: true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize: 0,
      getTextStyles: (value) => const TextStyle(
        color: Color(0xff9C9EA5),
        fontSize: 16,
      ),
      getTitles: (value) {
        switch (value.toInt()) {
          case 2:
            return '';
          case 5:
            return '';
          case 8:
            return '';
        }
        return '';
      },
      margin: 8,
    ),
    leftTitles: SideTitles(
      showTitles: true,
      getTextStyles: (value) => const TextStyle(
        color: Color(0xff67727d),
        fontSize: 13,
      ),
      getTitles: (value) {
        switch (value.toInt()) {
          case 1:
            return '1';
          case 2:
            return '2';
          case 3:
            return '3';
          case 4:
            return '4';
          case 5:
            return '5';
          case 6:
            return '6';
          case 7:
            return '7';
        }
        return '';
      },
      reservedSize: 5,
      margin: 10,
    ),
  );
}