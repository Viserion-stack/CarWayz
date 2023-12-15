import 'package:camera/camera.dart';
import 'package:car_wayz/core/theme/theme.dart';
import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/screens/add/widgets/preview_camera.dart';
import 'package:car_wayz/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  static const routeName = '/add';

  const AddScreen({super.key});
  static Page<void> page() => const MaterialPage<void>(child: AddScreen());

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  late CameraController _controller;
  late List<CameraDescription> cameras;

  final ImagePicker picker = ImagePicker();
  late XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: PreviewCamera(
              onReady: (CameraController cameraController) {
                _controller = cameraController;
              },
              onError: (CameraException error) {
                print("Przeczyść aparat");
              },
            ),
          ),
          _SelectImageButton(
            onPressed: () async {
              image = await picker.pickImage(source: ImageSource.gallery);

              if (image != null) {
                print(image!.path);
              }
            },
          ),
          _CloseButton(
            onPressed: () => context.go(DashboardScreen.routeName),
          ),
          _TakePhotoButton(
            onPressed: () {},
          ),
        ],
      ),
      extendBody: true,
    );
  }
}

class _TakePhotoButton extends StatelessWidget {
  const _TakePhotoButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  static const _buttonSize = 80.0;
  static const _buttonBorderWidth = 3.0;
  static const _buttonRadius = 31.0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CupertinoButton(
        onPressed: () {},
        child: SizedBox(
          width: _buttonSize,
          height: _buttonSize,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: const CircleBorder(),
              side: const BorderSide(
                color: Colors.white,
                width: _buttonBorderWidth,
              ),
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: _buttonRadius,
            ),
          ),
        ),
      ),
    );
  }
}

class _SelectImageButton extends StatelessWidget {
  const _SelectImageButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: CupertinoButton(
        onPressed: onPressed,
        child: Icon(
          Icons.photo_library_sharp,
          size: 30,
          color: context.palette.accentColor,
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(-0.95, -0.95),
      child: CupertinoButton(
        onPressed: onPressed,
        child: Icon(
          Icons.close,
          size: 30,
          color: context.palette.textOnPrimaryColor,
        ),
      ),
    );
  }
}
