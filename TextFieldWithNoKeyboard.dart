//Create a custom Textfield Widget extending editable:

//=====CUSTOM WIDGET TO HIDE KEYBOARD WHILE ACCEPTING VALUE FOR BARCODE CODE SCANNER DEVICE =====//
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWithNoKeyboard extends EditableText {
  TextFieldWithNoKeyboard(
      {required TextEditingController controller,
        required TextStyle style,
        required Function onValueUpdated,
        required Color cursorColor,
        required bool readonly,
        bool autofocus = false,
        Color selectionColor = Colors.transparent})
      : super(
      controller: controller,
      readOnly: readonly,
      // keyboardType: TextInputType.none,
      focusNode: TextfieldFocusNode(),
      style: style,
      cursorColor: cursorColor,
      autofocus: autofocus,
      selectionColor: selectionColor,
      backgroundCursorColor: Colors.black,
      onChanged: (value){
        print(value);
      },
      onEditingComplete: () {
        onValueUpdated(controller.text);
      }
      );

  @override
  EditableTextState createState() {
    return TextFieldEditableState();
  }
}

//This is to hide keyboard when user tap on textfield.
class TextFieldEditableState extends EditableTextState {
  @override
  void requestKeyboard() {
    super.requestKeyboard();
    //hide keyboard
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}

// This hides keyboard from showing on first focus / autofocus
class TextfieldFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    return false;
  }
}