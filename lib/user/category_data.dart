// class Addressvalidator() {
// String? _validateAddress(String? value) {
//     String addressRegex = r'^[a-zA-Z]+';
//     RegExp regex = RegExp(addressRegex);
//     if (value == null || value.isEmpty || !regex.hasMatch(value)) {
//       return 'This fiels is Empty';
//     }
//     return null;
//   }

//   String? _validateName(String? value) {
//     String nameRegex = r'^[a-zA-Z ]+$';
//     RegExp regex = RegExp(nameRegex);
//     if (value == null || value.isEmpty || !regex.hasMatch(value)) {
//       return 'This field id empty';
//     }
//     return null;
//   }

//   String? _validatePhoneNumber(String? value) {
//     String phoneRegex = r'^[6-9][0-9]{9}$';
//     RegExp regex = RegExp(phoneRegex);
//     if (value == null || value.isEmpty || !regex.hasMatch(value)) {
//       return 'Enter a valid 10-digit phone number';
//     }
//     return null;
//   }

//   String? _validateAddresss(String? value) {
//     String addresssRegex = r'^[0-9]{6,}$';
//     RegExp regex = RegExp(addresssRegex);
//     if (value == null || value.isEmpty || !regex.hasMatch(value)) {
//       return 'This field is empty';
//     }
//     return null;
//   }

//   String? _validateCity(String? value) {
//     String cityRegex = r'^[0-9]{6,}$';
//     RegExp regex = RegExp(cityRegex);
//     if (value == null || value.isEmpty || !regex.hasMatch(value)) {
//       return 'fill in the field';
//     }s
//     return null;
//   }

//   String? _validatePincode(String? value) {
//     String pincodeRegex = r'^[0-9]{6,}$';
//     RegExp regex = RegExp(pincodeRegex);
//     if (value == null || value.isEmpty || !regex.hasMatch(value)) {
//       return 'enter the valid pincode';
//     }
//     return null;
//   }
// }