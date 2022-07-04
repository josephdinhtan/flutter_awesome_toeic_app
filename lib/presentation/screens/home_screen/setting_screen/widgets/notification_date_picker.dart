import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotificationDatePicker extends StatelessWidget {
  const NotificationDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Frequency'),
          DropdownButton<String>(
            value: 'daily',
            items: <String>['daily', 'weekly'].map((String value) {
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
