// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(String?);

class LoadingScreenController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  LoadingScreenController({
    required this.close,
    required this.update,
  });
}

class LoadingScreen {
  LoadingScreen._();
  static final LoadingScreen _shared = LoadingScreen._();
  factory LoadingScreen() => _shared;

  LoadingScreenController? controller;

  void show({required BuildContext context, required String text}) {
    if (controller?.update(text) ?? false) {
      return;
    } else {
      controller = showOverLay(
        context: context,
        text: text,
      );
    }
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  LoadingScreenController showOverLay({
    required BuildContext context,
    required String text,
  }) {
    final _text = StreamController<String>();
    final state = Overlay.of(context);
    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(50),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0x00ffffff)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          backgroundColor: Color(0xff880000),
                          color: Color(0xffff0000),
                          strokeWidth: 6,
                        ),
                      ),
                      StreamBuilder(
                        builder: (context, snapshot) {
                          String text = "";
                          if (snapshot.hasData) {
                            text = snapshot as String;
                          }
                          return Container(
                            child: (text.isNotEmpty)
                                ? Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      text,
                                    ),
                                  )
                                : null,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    state?.insert(overlay);

    return LoadingScreenController(
      close: () {
        log("close");
        _text.close();
        overlay.remove();
        return true;
      },
      update: (text) {
        log("open");
        if (text != null) {
          _text.add(text);
        }
        return true;
      },
    );
  }
}
