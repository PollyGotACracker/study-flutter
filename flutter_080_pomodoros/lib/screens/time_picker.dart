import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({
    Key? key,
  }) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  Duration _duration = const Duration(hours: 0, minutes: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: DurationPicker(
              duration: _duration,
              onChange: (val) {
                setState(() => _duration = val);
              },
              snapToMins: 5.0,
            ))
          ],
        ),
      ),
      floatingActionButton: Builder(
          builder: (BuildContext context) => FloatingActionButton(
                onPressed: () async {
                  var resultingDuration = await showDurationPicker(
                    context: context,
                    initialTime: const Duration(minutes: 30),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Chose duration: $resultingDuration')));
                },
                tooltip: 'Popup Duration Picker',
                child: const Icon(Icons.add),
              )),
    );
  }
}
