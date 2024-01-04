import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef DateTimeCallback = void Function({
  required String formTime,
  required String formDateOnly,
  required String formatedDateTime,
});

selectDateTime(
    {showDate = true,
    showTime = true,
    required BuildContext context,
    required DateTimeCallback callback}) async {
  FocusManager.instance.primaryFocus?.unfocus();

  String formTime = "";
  String formDateOnly = "";
  String formatedDateTime = "";

  DateTime now = DateTime.now();
  TimeOfDay timeNow = TimeOfDay.now();
  TimeOfDay? pickedTime;
  DateTime? selectedDate;

  if (showDate) {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, 1, 1),
      lastDate: DateTime(now.year, 12, 31),
    );
  }

  if (showTime) {
    // ignore: use_build_context_synchronously
    pickedTime = await showTimePicker(
      context: context,
      initialTime: timeNow,
    );
  }

  if (selectedDate != null) {
    formDateOnly = DateFormat("yyyy-MM-dd").format(selectedDate);
  }

  if (pickedTime != null) {
    final DateTime tempDate =
        DateTime(2000, 1, 1, pickedTime.hour, pickedTime.minute);
    final String formattedTime = DateFormat("HH:mm:ss").format(tempDate);

    formTime = formattedTime;
  }

  if (selectedDate != null && pickedTime != null) {
    DateTime dateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    formatedDateTime = DateFormat("yyyy-MM-dd HH:mm").format(dateTime);
  }

  callback(
    formTime: formTime,
    formDateOnly: formDateOnly,
    formatedDateTime: formatedDateTime,
  );
}
