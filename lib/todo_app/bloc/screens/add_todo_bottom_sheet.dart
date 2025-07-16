import 'package:flutter/material.dart';

class AddTodoBottomSheet extends StatefulWidget {
  const AddTodoBottomSheet({super.key});

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  TextEditingController controller = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        height: 300,
        child: Column(
          children: [
            Text(
              '할일 추가',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            TextField(
              controller: controller,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {});
              },
            ),
            ElevatedButton(
              onPressed: () async {
                var date = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (date != null) {
                  setState(() {
                    selectedTime = date;
                  });
                }
              },
              child: Text('${selectedTime.hour}시 ${selectedTime.minute}분'),
            ),
            ElevatedButton(
              onPressed: () {
                if(controller.text.isEmpty) {}
                else {
                  Navigator.pop(context, [controller.text, selectedTime]);
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (controller.text.isEmpty) {
                      return Colors.grey;
                    }
                    return Colors.blue;
                  },
                ),
              ),
              child: Text('완료'),
            ),
          ],
        ),
      ),
    );
  }
}
