import 'package:flutter/material.dart';

bool _isShowing = false;

class Loading {
  late BuildContext _context;

  Loading(BuildContext context) {
    _context = context;
  }

  void show() {
    if (!_isShowing) {
      _isShowing = true;

      showDialog(
          context: _context,
          barrierDismissible: false,
          useRootNavigator: true,
          builder: (BuildContext context) {
            return WillPopScope(
                child: Dialog(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 4.0,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.green[600]),
                              )),
                        ),
                        const Expanded(
                          child: Text(
                            "Processando",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                onWillPop: () => Future.value(false));
          });
    }
  }

  void hide() {
    if (_isShowing && Navigator.of(_context).canPop()) {
      _isShowing = false;
      Navigator.of(_context, rootNavigator: true).pop();
    }
  }
}
