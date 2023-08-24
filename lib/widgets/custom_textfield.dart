import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomFormField extends StatefulWidget {
  final Color color;
  final String hintText;
  final IconData icon;
  final double border;
  final bool isPasswordField;
  final TextEditingController controller;
  final bool? isOutlinedBorder;
  final String? Function(String?)? validator;
  CustomFormField({
    required this.color,
    required this.hintText,
    required this.icon,
    required this.border,
    this.isOutlinedBorder = true,
    this.isPasswordField = false,
    required this.controller,
    this.validator,
  });
  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final outlineBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.border),
      borderSide: BorderSide(
        color: Colors.black.withOpacity(0.4),
      ),
    );
    final focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.border),
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    );

    final underlineBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black.withOpacity(0.4),
      ),
    );
    final enableBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black.withOpacity(0.4),
      ),
    );

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPasswordField ? _obscureText : false,
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.border),
            borderSide: BorderSide(
              color: Colors.red.withOpacity(0.4),
            )),
        enabledBorder:
            widget.isOutlinedBorder! ? outlineBorder : underlineBorder,
        focusedBorder: focusBorder,
        fillColor: widget.color,
        filled: true,
        hintText: widget.hintText,
        suffixIcon: widget.isPasswordField
            ? _buildPasswordFieldVisibilityToggle()
            : null,
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.border),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.black,
        ),
      ),
      validator: widget.validator,
    );
  }

  Widget _buildPasswordFieldVisibilityToggle() {
    return IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
        color: Colors.black45,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }
}



// class CustomFormField extends StatefulWidget {
//   final String? labelText;
//   final String? hintText;
//   final double? border;
//   final String? label;
//   final IconData? icon;
//   final TextInputType? keyboardType;
//   final bool? isPasswordField;
//   final TextEditingController? controller;
//   final bool? enabled;
//   final double? height;
//   final int? maxLines;
//   final Function? onTap;
//   final bool readOnly;
//   final bool isOutlineBorder;
//   final List<TextInputFormatter>? inputFormatters;
//   final String? Function(String?)? validator;
//   final Function(String)? onChanged;
//   final double? bottomPadding;
//   final Widget? prefixIcon;
//   final Color? color;
//    const CustomFormField({

//     Key? key,
//     this.hintText,
//     this.labelText,
//     this.color,
//     this.label,
//     this.icon,
//     this.border = 30,
//     this.keyboardType = TextInputType.text,
//     this.isPasswordField = false,
//     this.controller,
//     this.enabled = true,
//     this.height,
//     this.maxLines = 1,
//     this.onTap,
//     this.readOnly = false,
//     this.isOutlineBorder = true,
//     this.inputFormatters,
//     this.validator,
//     this.onChanged,
//     this.bottomPadding = 20.0,
//     this.prefixIcon,
//   }) : super(key: key);
//   @override
//   _CustomFormFieldState createState() => _CustomFormFieldState();
// }

// class _CustomFormFieldState extends State<CustomFormField> {
//   bool _obscureText = true;

//   String? _validateField(String? value) {
//     if (widget.validator != null) {
//       return widget.validator!(value);
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final outlineBorder = OutlineInputBorder(
//       borderRadius: BorderRadius.circular(widget.border!),
//       borderSide: BorderSide(
//         color: Colors.black.withOpacity(0.4),
//       ),
//     );
//     final focusBorder = OutlineInputBorder(
//       borderRadius: BorderRadius.circular(widget.border!),
//       borderSide: const BorderSide(
//         color: Colors.black,
//       ),
//     );

//     final underlineBorder = UnderlineInputBorder(
//       borderSide: BorderSide(
//         color: Colors.black.withOpacity(0.4),
//       ),
//     );
//     final enableBorder = UnderlineInputBorder(
//       borderSide: BorderSide(
//         color: Colors.black.withOpacity(0.4),
//       ),
//     );

//     return Padding(
//       padding: EdgeInsets.only(
//         bottom: widget.bottomPadding!,
//       ),
//       child: TextFormField(
//         validator: _validateField,
//         decoration: InputDecoration(
//           hintText: widget.hintText??null,
//            hintStyle: TextStyle(
//             fontWeight: FontWeight.w400,
//             fontSize: 14,
//             color: widget.color!,
//           ),
//           focusedBorder: focusBorder,
//           contentPadding: EdgeInsets.all(10),
//           // labelText: widget.labelText??null,
//           // labelStyle: TextStyle(
//           //   fontWeight: FontWeight.w400,
//           //   fontSize: 14,
//           //   color: widget.color!,
//           // ),
//           prefixIcon: widget.prefixIcon != null
//               ? widget.prefixIcon
//               : widget.icon != null
//                   ? Icon(
//                       widget.icon,
//                       color: Colors.black45.withOpacity(0.4),
//                     )
//                   : null,
//           enabledBorder:
//               widget.isOutlineBorder ? outlineBorder : underlineBorder,
//           border: widget.isOutlineBorder ? outlineBorder : underlineBorder,
//           suffixIcon: widget.isPasswordField!
//               ? _buildPasswordFieldVisibilityToggle()
//               : null,
//         ),
//         style:const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
//         keyboardType: widget.keyboardType,
//         cursorColor: Colors.black45,
//         textAlign: TextAlign.start,
//         textAlignVertical: TextAlignVertical.center,
//         obscureText: widget.isPasswordField! ? _obscureText : false,
//         controller: widget.controller,
//         enabled: widget.enabled,
//         maxLines: widget.maxLines,
//         // onTap: () => widget.onTap,
//         readOnly: widget.readOnly,
//         inputFormatters: widget.inputFormatters ?? null,
//         // onChanged: widget.onChanged,
        
//       ),
//     );
//   }

//   Widget _buildPasswordFieldVisibilityToggle() {
//     return IconButton(
//       icon: Icon(
//         _obscureText ? Icons.visibility_off : Icons.visibility,
//         color: Colors.black45,
//       ),
//       onPressed: () {
//         setState(() {
//           _obscureText = !_obscureText;
//         });
//       },
//     );
//   }
// }