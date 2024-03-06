import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 
            AppLocalizations.of(context)!.wiseapp,
),
      ),
    );
  }
}
class HomeCopyWidget extends StatefulWidget {
  const HomeCopyWidget({Key? key}) : super(key: key);

  @override
  State<HomeCopyWidget> createState() => _HomeCopyWidgetState();
}

class _HomeCopyWidgetState extends State<HomeCopyWidget> {
  late TextEditingController _textController;
  late FocusNode _textFieldFocusNode;
  bool _switchValue = true;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _textController.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_textFieldFocusNode.canRequestFocus) {
          FocusScope.of(context).requestFocus(_textFieldFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: _switchValue ? Colors.grey[200] : Colors.black,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/WiseApp_Light.png',
                        width: 230,
                        height: 45,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(90, 0, 20, 0),
                    child: Switch.adaptive(
                      value: _switchValue,
                      onChanged: (newValue) {
                        setState(() {
                          _switchValue = newValue;
                        });
                      },
                      activeColor: Colors.blue,
                      activeTrackColor: Colors.lightBlue,
                      inactiveTrackColor: Colors.grey,
                      inactiveThumbColor: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(1, -1),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                  child: Container(
                    width: 2537,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    alignment: AlignmentDirectional.center,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.search_rounded,
                            color: Colors.grey,
                            size: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                              child: Container(
                                width: 200,
                                child: TextField(
                                  controller: _textController,
                                  focusNode: _textFieldFocusNode,
                                  decoration: InputDecoration(
                                    labelText:  AppLocalizations.of(context)!.searchapphere,
                                    labelStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                  ),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
                                  ),
                                  cursorColor: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.mic_none,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Opacity(
                        opacity: 0.6,
                        child: Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                            child: Text(
                               AppLocalizations.of(context)!.socialmedia,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 22,
                                color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.grey[200],
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    // Handle onTap
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Image.asset(
                                            'assets/images/Instagram_logo_2016.svg.png',
                                            width: 150,
                                            height: 150,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Text(
                                         AppLocalizations.of(context)!.instagram,
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 22,
                                          color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/snapchat-logo-filters-png-5.png',
                                        height: 150,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                  Text(                 
                                     AppLocalizations.of(context)!.snapchat,

                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 22,
                                      color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/pinterest-logos-vector-png-hd-14.png',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Text(                           
                                              AppLocalizations.of(context)!.pinterest,
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 22,
                                      color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/1690643640twitter-x-icon-png.webp',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Text(        
                                      AppLocalizations.of(context)!.x,

                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 22,
                                      color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                            child: Text(
                               AppLocalizations.of(context)!.paymentfinance,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 23,
                                color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.grey[200],
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.asset(
                                          'assets/images/605abdb7af3405c6b20a426b1e128322.jpg',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                       AppLocalizations.of(context)!.gpay,
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 22,
                                        color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/Screenshot_2024-02-23_at_23.57.04.png',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Text(
                                     AppLocalizations.of(context)!.phonepay,
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 22,
                                      color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/Screenshot_2024-02-23_at_23.58.44.png',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Text(
                                     AppLocalizations.of(context)!.paytm,
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 22,
                                      color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                            child: Text(
                               AppLocalizations.of(context)!.foodeliveryapp,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 23,
                                color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Colors.grey[200],
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.asset(
                                          'assets/images/Zomato_logo.png',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Text(
                                       AppLocalizations.of(context)!.zomato,
                                      style: TextStyle(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 22,
                                        color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/unnamed-2.png',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Text(
                                     AppLocalizations.of(context)!.swiggy,
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 22,
                                      color: _switchValue ? Colors.black : Colors.white, // Change text color based on switch value
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        'assets/images/uber-eats-logo-39748746B7-seeklogo.com.png',
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Opacity(
  opacity: 0.6,
  child: Column(
    children: [
      Align(
        alignment: AlignmentDirectional(-1, 0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
          child: Text(
           AppLocalizations.of(context)!.travelapp,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Readex Pro',
              fontSize: 23,
            ),
          ),
        ),
      ),
    ],
  ),
),


                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color:  Colors.grey[200],
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.asset(
                                            'assets/images/unnamed.png',
                                            width: 150,
                                            height: 150,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Text(
                                         AppLocalizations.of(context)!.irctc,
                                        style: TextStyle(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 22,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/images/unnamed-4.png',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Text(
                                       AppLocalizations.of(context)!.makemytrip,
                                      style: TextStyle(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 22,
                                          ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset(
                                          'assets/images/unnamed.png',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Text(
                                    AppLocalizations.of(context)!.whereismytrain,

                                      style:TextStyle(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 22,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.6,
                        child: Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                            child: Text(
                                AppLocalizations.of(context)!.navigationapp,

                              textAlign: TextAlign.start,
                              style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 23,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color:  Colors.grey[200],
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.asset(
                                                    'assets/images/google-maps-logo-on-transparent-white-background-free-vector.jpg',
                                                    width: 150,
                                                    height: 150,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Text(                                    
                                                 AppLocalizations.of(context)!.googlemaps,

                                                style:
                                                    TextStyle(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 22,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.asset(
                                                    'assets/images/unnamed-3.png',
                                                    width: 150,
                                                    height: 150,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                              Text(                                     
                                                AppLocalizations.of(context)!.gpsnavigation,

                                                style:
                                                    TextStyle(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 22,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.asset(
                                                'assets/images/unnamed-2.png',
                                                width: 150,
                                                height: 150,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            AppLocalizations.of(context)!.waze,
                                            style: TextStyle(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 22,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                            ],
              ),
                        ),
          ),
                    ],
      ),
                )
              )
            ]
          )
        )
      )

    );
  }
}