import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.ispassword,
    this.onChanged, required this.hintText, required this.icon,
  });

  final bool ispassword;
  final void Function(String)? onChanged;
final String hintText;
final  IconData icon;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return widget.ispassword
        ? Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
            child: TextFormField(
              onChanged: widget.onChanged,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Value Requered';
                }
                return null;
              },
              obscureText: isObscure,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                suffixIcon: GestureDetector(
                  onTap: () {
                    isObscure = !isObscure;
                    setState(() {});
                  },
                  child: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.blue,size: 30,),
                ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Colors.black, fontSize: 17),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          )
        : Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 5),
            child: TextFormField(
              onChanged: widget.onChanged,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Value Requered';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                suffixIcon:  Icon(widget.icon,size: 30,),
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Colors.black, fontSize: 17),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          );
  }
}
