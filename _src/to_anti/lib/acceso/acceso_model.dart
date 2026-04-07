import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'acceso_widget.dart' show AccesoWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccesoModel extends FlutterFlowModel<AccesoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for nombrepc widget.
  FocusNode? nombrepcFocusNode;
  TextEditingController? nombrepcTextController;
  String? Function(BuildContext, String?)? nombrepcTextControllerValidator;
  // State field(s) for emailpc widget.
  FocusNode? emailpcFocusNode;
  TextEditingController? emailpcTextController;
  String? Function(BuildContext, String?)? emailpcTextControllerValidator;
  // State field(s) for webpc widget.
  FocusNode? webpcFocusNode;
  TextEditingController? webpcTextController;
  String? Function(BuildContext, String?)? webpcTextControllerValidator;
  // State field(s) for telefonopc widget.
  FocusNode? telefonopcFocusNode;
  TextEditingController? telefonopcTextController;
  String? Function(BuildContext, String?)? telefonopcTextControllerValidator;
  // State field(s) for cuentanospc widget.
  FocusNode? cuentanospcFocusNode;
  TextEditingController? cuentanospcTextController;
  String? Function(BuildContext, String?)? cuentanospcTextControllerValidator;
  // State field(s) for Checkboxpc widget.
  bool? checkboxpcValue;
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  // State field(s) for web widget.
  FocusNode? webFocusNode;
  TextEditingController? webTextController;
  String? Function(BuildContext, String?)? webTextControllerValidator;
  // State field(s) for cuentanos widget.
  FocusNode? cuentanosFocusNode;
  TextEditingController? cuentanosTextController;
  String? Function(BuildContext, String?)? cuentanosTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombrepcFocusNode?.dispose();
    nombrepcTextController?.dispose();

    emailpcFocusNode?.dispose();
    emailpcTextController?.dispose();

    webpcFocusNode?.dispose();
    webpcTextController?.dispose();

    telefonopcFocusNode?.dispose();
    telefonopcTextController?.dispose();

    cuentanospcFocusNode?.dispose();
    cuentanospcTextController?.dispose();

    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    webFocusNode?.dispose();
    webTextController?.dispose();

    cuentanosFocusNode?.dispose();
    cuentanosTextController?.dispose();
  }
}
