import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotificationTimePicker extends StatelessWidget {
  const NotificationTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Time'),
          DropdownButton<String>(
            value: '8:00',
            items: <String>['8:00', '12:00'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
