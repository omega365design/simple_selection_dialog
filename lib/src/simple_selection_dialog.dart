import 'package:flutter/material.dart';

class SimpleSelectionDialog extends StatelessWidget {
  final Map<String, String> options;

  const SimpleSelectionDialog({
    Key key,
    this.options = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Dialog(
      elevation: 0,
      insetPadding: EdgeInsets.zero,
      backgroundColor: const Color(0x00000000),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: options.keys.map((key) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pop(options[key]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Text(
                          key.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headline5
                              .copyWith(color: Color(0xFFFFFFFF)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: RaisedButton(
                padding: const EdgeInsets.all(16.0),
                shape: CircleBorder(),
                child: Icon(
                  Icons.close,
                  size: 24,
                  color: const Color(0xFF000000),
                ),
                color: const Color(0xFF70EFDE),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
