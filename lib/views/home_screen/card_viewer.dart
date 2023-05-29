import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: unused_import
import 'package:sleep_walking_detector/consts/consts.dart';

class CardViewer extends StatelessWidget {
  final DateTime dateTime;

  const CardViewer({Key? key, required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Date:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ).paddingOnly(top: 2),
              ],
            ),
            const SizedBox(width: 8),
            Row(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Time:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ).paddingOnly(top: 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
