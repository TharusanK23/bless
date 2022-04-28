// ignore_for_file: file_names
import 'package:bless/routes/index.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Function() onPressed;
  final String title;
  final IconData? icon;
  final double iconSize;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  const AppButton({
    Key? key,
    this.width,
    this.height,
    required this.title,
    required this.onPressed,
    this.icon,
    this.backgroundColor = primary,
    this.textColor = light,
    this.borderColor = primary,
    this.iconSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry edgeInsets = const EdgeInsets.all(0);
    if (width == null || height == null) {
      edgeInsets = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
    }

    return Padding(
      padding: edgeInsets,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(25.0),
        highlightColor: transparent,
        child: Container(
          width: width,
          height: height,
          padding: edgeInsets,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: backgroundColor.withOpacity(0.3),
                blurRadius: 4.0,
                offset: const Offset(2.0, 4.0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildIcon(),
                _buildTitle(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: const TextStyle(color: light, fontSize: 18.0, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildIcon() {
    if (icon != null) {
      return Padding(
        padding: const EdgeInsets.only(
          right: 8.0,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color: light,
        ),
      );
    }

    return const SizedBox();
  }
}
