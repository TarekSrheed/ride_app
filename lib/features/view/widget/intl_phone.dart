import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class IntlPhoneFildWidget extends StatelessWidget {
  IntlPhoneFildWidget({
    super.key,
    required this.phoneController,
  });
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: phoneController,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      initialCountryCode: 'IN',
    );
  }
}
