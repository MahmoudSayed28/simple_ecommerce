import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key, required this.text, required this.option, this.onTap,
  });
final String text;
final String option;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
        Text(
        text,
         style: const TextStyle(color: Colors.black, fontSize: 20),
       ),
       GestureDetector(
        onTap: onTap,
         child:  Text(
           option,
           style: const TextStyle(color: Colors.blue, fontSize: 22),
         ),
       ),
     ],
                );
  }
}
