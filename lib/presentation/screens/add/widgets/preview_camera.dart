import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PreviewCamera extends StatefulWidget {
  final Function(CameraController cameraController) onReady;
  final Function(CameraException error) onError;

  const PreviewCamera({
    super.key,
    required this.onReady,
    required this.onError,
  });
  static const cameraPerrmissionErrorCodes = [
    'cameraPermission',
    'CameraAccessDenied',
    'CameraAccessDeniedWithoutPrompt',
    'CameraAccessRestricted',
  ];
  @override
  State<PreviewCamera> createState() => _ArtCameraState();
}

class _ArtCameraState extends State<PreviewCamera> with WidgetsBindingObserver {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _initializeControllerFuture = _initializeController();
    super.initState();
  }

  Future<void> _initializeController() async {
    try {
      final cameras = await availableCameras();
      final cameraDescription = cameras.first;
      _cameraController = CameraController(
        cameraDescription,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.yuv420,
      );
      await _cameraController.initialize();
      widget.onReady(_cameraController);
    } on CameraException catch (error) {
      widget.onError(error);
    }
  }

  Future<void> _disposeController() async {
    if (_cameraController.value.isInitialized == true) {
      await _cameraController.dispose();
    }
  }

  @override
  void dispose() {
    _cameraController.dispose();
    _disposeController();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_cameraController.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _disposeController();
    } else if (state == AppLifecycleState.resumed) {
      setState(() {
        _initializeControllerFuture = _initializeController();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        final isCameraReady =
            snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasError &&
                _cameraController.value.isInitialized == true;
        if (!isCameraReady) {
          return const ColoredBox(color: Colors.black);
        }
        return CameraPreview(_cameraController);
      },
    );
  }
}
