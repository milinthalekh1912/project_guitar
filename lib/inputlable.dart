import 'package:flutter/material.dart';

class InputButton extends StatelessWidget {
  final String lableInput;

  const InputButton({
    required this.lableInput,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(lableInput),
          const SizedBox(
            width: 20,
          ),
          Container(
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
