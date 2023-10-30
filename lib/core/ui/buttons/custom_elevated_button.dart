import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// A button that shows a loading indicator when pressed.
/// The button is disabled while loading.
/// The loading indicator is a [SpinKitWave] widget.
/// The button is a [ElevatedButton] widget.
class CustomElevatedButton extends ConsumerStatefulWidget {
  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      this.style,
      this.child = const Text("Invia")});

  final dynamic Function()? onPressed;
  final Widget? child;
  final ButtonStyle? style;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends ConsumerState<CustomElevatedButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading
          ? null
          : () async {
              try {
                setState(() {
                  _isLoading = true;
                });
                await widget.onPressed!();
                setState(() {
                  _isLoading = false;
                });
              } catch (e) {
                setState(() {
                  _isLoading = false;
                });
              }
            },
      style: widget.style,
      child: _isLoading
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpinKitWave(
                  color: Theme.of(context).primaryColor,
                  size: 12,
                ),
              ],
            )
          : widget.child,
    );
  }
}
