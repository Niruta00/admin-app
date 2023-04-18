import 'package:admin_app/res/color.dart';
import 'package:flutter/material.dart';



class RoundButton extends StatefulWidget {
  final String title;
  final bool loading;
  final VoidCallback onPressed;
  const RoundButton(
      {super.key,
      required this.onPressed,
      this.loading = false,
      required this.title});

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.blueColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3))
            ]),
        child: Center(
            child: widget.loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                :  Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
      ),
    );
  }
}