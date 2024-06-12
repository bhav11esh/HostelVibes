import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'f_ilters_for_hostel_widget.dart' show FIltersForHostelWidget;
import 'package:flutter/material.dart';

class FIltersForHostelModel extends FlutterFlowModel<FIltersForHostelWidget> {
  ///  Local state fields for this page.

  List<dynamic> loacalfilter = [];
  void addToLoacalfilter(dynamic item) => loacalfilter.add(item);
  void removeFromLoacalfilter(dynamic item) => loacalfilter.remove(item);
  void removeAtIndexFromLoacalfilter(int index) => loacalfilter.removeAt(index);
  void insertAtIndexInLoacalfilter(int index, dynamic item) =>
      loacalfilter.insert(index, item);
  void updateLoacalfilterAtIndex(int index, Function(dynamic) updateFn) =>
      loacalfilter[index] = updateFn(loacalfilter[index]);

  List<String> lf = [];
  void addToLf(String item) => lf.add(item);
  void removeFromLf(String item) => lf.remove(item);
  void removeAtIndexFromLf(int index) => lf.removeAt(index);
  void insertAtIndexInLf(int index, String item) => lf.insert(index, item);
  void updateLfAtIndex(int index, Function(String) updateFn) =>
      lf[index] = updateFn(lf[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CheckboxGroupPropertytype widget.
  FormFieldController<List<String>>? checkboxGroupPropertytypeValueController;

  List<String>? get checkboxGroupPropertytypeValues =>
      checkboxGroupPropertytypeValueController?.value;
  set checkboxGroupPropertytypeValues(List<String>? v) =>
      checkboxGroupPropertytypeValueController?.value = v;

  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for Room1 widget.
  FormFieldController<List<String>>? room1ValueController;

  List<String>? get room1Values => room1ValueController?.value;
  set room1Values(List<String>? v) => room1ValueController?.value = v;

  // State field(s) for Room2 widget.
  FormFieldController<List<String>>? room2ValueController;

  List<String>? get room2Values => room2ValueController?.value;
  set room2Values(List<String>? v) => room2ValueController?.value = v;

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for Faciliteschoicechips widget.
  FormFieldController<List<String>>? faciliteschoicechipsValueController;
  List<String>? get faciliteschoicechipsValues =>
      faciliteschoicechipsValueController?.value;
  set faciliteschoicechipsValues(List<String>? val) =>
      faciliteschoicechipsValueController?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
