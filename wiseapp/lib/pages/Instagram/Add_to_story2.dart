import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'addtostory2_ig_model.dart';
export 'addtostory2_ig_model.dart';

class Addtostory2IgWidget extends StatefulWidget {
  const Addtostory2IgWidget({super.key});

  @override
  State<Addtostory2IgWidget> createState() => _Addtostory2IgWidgetState();
}

class _Addtostory2IgWidgetState extends State<Addtostory2IgWidget>
    with TickerProviderStateMixin {
  late Addtostory2IgModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1240.ms,
          begin: Offset(1, 1),
          end: Offset(1.5, 1.5),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Addtostory2IgModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/WhatsApp_Image_2024-02-28_at_23.25.40_(1).jpeg',
                    width: 435,
                    height: 825,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Opacity(
                opacity: 0,
                child: Align(
                  alignment: AlignmentDirectional(-0.94, -0.9),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('ADDTOSTORY1_IG');
                    },
                    child: Icon(
                      Icons.settings_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 50,
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: Align(
                  alignment: AlignmentDirectional(0, 0.43),
                  child: Lottie.asset(
                    'assets/lottie_animations/Animation_-_1709196170491.json',
                    width: 398,
                    height: 440,
                    fit: BoxFit.fitWidth,
                    animate: true,
                  ),
                ),
              ),
              Opacity(
                opacity: 0,
                child: Align(
                  alignment: AlignmentDirectional(0.01, 0.22),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).primary,
                    borderRadius: 20,
                    borderWidth: 1,
                    buttonSize: 105,
                    fillColor: FlutterFlowTheme.of(context).accent1,
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24,
                    ),
                    onPressed: () async {
                      context.pushNamed('ADDTOSTORY3_IG');
                    },
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.01, -0.79),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {},
                  child: Text(
                    'Use your camera to \nclick a photo or select\n from your gallery',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22,
                        ),
                  ),
                ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
