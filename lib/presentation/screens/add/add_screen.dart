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
          Align(
            alignment: Alignment.bottomLeft,
            child: CupertinoButton(
              child: Icon(
                Icons.photo_library_sharp,
                size: 30,
                color: context.palette.accentColor,
              ),
              onPressed: () async {
                image = await picker.pickImage(source: ImageSource.gallery);

                if (image != null) {
                  print(image!.path);
                }
              },
            ),
          ),
          Align(
            alignment: const Alignment(-0.95, -0.95),
            child: CupertinoButton(
              child: Icon(
                Icons.close,
                size: 30,
                color: context.palette.textOnPrimaryColor,
              ),
              onPressed: () => context.go(DashboardScreen.routeName),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CupertinoButton(
              onPressed: () {},
              child: SizedBox(
                width: 80.0,
                height: 80.0,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0.0),
                    backgroundColor: Colors.transparent,
                    shape: const CircleBorder(),
                    side: const BorderSide(
                      color: Colors.white,
                      width: 3.0,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 31,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
    );
  }
}

class _AddAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AddAppBar({
    this.leading,
    this.title,
    this.action,
    super.key,
  });

  final Widget? leading;
  final Widget? title;
  final Widget? action;

  static const _appBarHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 20,
        left: 16,
        right: 16,
      ),
      child: Row(
        children: [
          leading ?? const SizedBox.shrink(),
          Expanded(child: title ?? const SizedBox.shrink()),
          action ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(_appBarHeight);
}
