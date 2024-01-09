import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/screens/add/provider/add_provider.dart';
import 'package:car_wayz/presentation/screens/add_post/add_post_screen.dart';
import 'package:flutter/cupertino.dart';

class AddScreen extends ConsumerStatefulWidget {
  static const routeName = '/add';

  const AddScreen({super.key});
  static Page<void> page() => const MaterialPage<void>(child: AddScreen());

  @override
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends ConsumerState<AddScreen> {
  CameraController? _cameraController;
  final ImagePicker picker = ImagePicker();
  late XFile? image;

  @override
  Widget build(BuildContext context) {
    Future<XFile?> takePhoto() async {
      try {
        if (_cameraController != null &&
            !_cameraController!.value.isTakingPicture) {
          final photo = await _cameraController!.takePicture();

          return photo;
        }
      } on Exception catch (_) {
        context.go(DashboardScreen.routeName);
      }

      return null;
    }

    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: PreviewCamera(
              onReady: (cameraController) {
                _cameraController = cameraController;
              },
              onError: (CameraException error) {
                debugPrint('Camera error');
              },
            ),
          ),
          _SelectImageButton(
            onPressed: () async {
              image = await picker.pickImage(source: ImageSource.gallery);

              if (image != null) {
                debugPrint(image!.path);
                ref.read(addProvider.notifier).setImage(image: image!.path);
              }
            },
          ),
          _CloseButton(
            onPressed: () => context.go(DashboardScreen.routeName),
          ),
          _TakePhotoButton(
            onPressed: () async {
              final photoData = await takePhoto();

              if (photoData != null) {
                ref.read(addProvider.notifier).setImage(image: photoData.path);
              }
              // ignore: use_build_context_synchronously
              context.push(AddPostScreen.routeName);
            },
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
  });

  final VoidCallback onPressed;

  static const _buttonSize = 80.0;
  static const _buttonBorderWidth = 2.0;
  static const _buttonInsidePadding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CupertinoButton(
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.all(_buttonInsidePadding),
          height: _buttonSize,
          width: _buttonSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.palette.textOnPrimaryColor,
              width: _buttonBorderWidth,
            ),
          ),
          child: CircleAvatar(
            backgroundColor: context.palette.textOnPrimaryColor,
            radius: _buttonSize,
          ),
        ),
      ),
    );
  }
}

class _SelectImageButton extends StatelessWidget {
  const _SelectImageButton({
    required this.onPressed,
  });

  final VoidCallback onPressed;

  static const _iconSize = 30.0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: CupertinoButton(
        onPressed: onPressed,
        child: Icon(
          Icons.photo_library_sharp,
          size: _iconSize,
          color: context.palette.accentColor,
        ),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({
    required this.onPressed,
  });

  final VoidCallback onPressed;

  static const _iconSize = 30.0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(-0.95, -0.95),
      child: CupertinoButton(
        onPressed: onPressed,
        child: Icon(
          Icons.close,
          size: _iconSize,
          color: context.palette.textOnPrimaryColor,
        ),
      ),
    );
  }
}
