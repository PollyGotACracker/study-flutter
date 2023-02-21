import 'package:flutter/material.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    super.key,
    required TextEditingController inputController,
    required this.labelText,
    required this.thisFocus,
    required this.nextFocus,
  }) : _inputController = inputController;

  final FocusNode thisFocus;
  final FocusNode nextFocus;
  final TextEditingController _inputController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        controller: _inputController,
        decoration: InputDecoration(labelText: labelText),
        style: const TextStyle(fontSize: 15, color: Colors.blue),
        validator: (value) {
          if (value!.isEmpty) {
            return "$labelText 항목을 입력해주세요";
          } else {
            return null;
          }
        },
        autovalidateMode: AutovalidateMode.always,
        // 키보드의 ->| 를 누르면 다음 focus 로 이동
        textInputAction: TextInputAction.next,
        focusNode: thisFocus,
        autofocus: true,
        onFieldSubmitted: (value) async {
          _inputController.text = value;
          FocusScope.of(context).requestFocus(nextFocus);

          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text(value)));
        },
      ),
    );
  }
}
