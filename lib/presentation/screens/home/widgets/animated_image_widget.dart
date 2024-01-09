import 'package:cached_network_image/cached_network_image.dart';

import '../../../../export.dart';

class Animatedimage extends StatefulWidget {
  final String imageUrl;
  final int pageIndex;
  final String artId;
  const Animatedimage({
    super.key,
    required this.imageUrl,
    required this.pageIndex,
    required this.artId,
  });

  @override
  State<Animatedimage> createState() => _AnimatedimageState();
}

class _AnimatedimageState extends State<Animatedimage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isimageError = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _animation = CurvedAnimation(
      curve: Curves.linear,
      parent: _animationController,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((animationStatus) {
        if (animationStatus == AnimationStatus.completed) {}
      });
    _animationController.repeat(reverse: true);

    super.initState();
  }

  void canceLisetner() {
    // ignore: invalid_use_of_protected_member
    _animationController.clearListeners();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.artId,
      //tag: 'tag-1',
      child: CachedNetworkImage(
        progressIndicatorBuilder: (_, url, download) {
          if (download.progress != null) {
            final percent = download.progress! * 100;
            return Text('$percent% done loading');
          }

          return const Text('Loaded Url');
        },
        errorWidget: (context, url, error) {
          canceLisetner();
          return Image.network(url);
        },
        imageUrl: widget.imageUrl,
        //alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
        alignment: FractionalOffset((_animation.value), 0),
        //alignment: Alignment((_animation.value), (-1 + _animation.value)),
      ),
    );
  }
}
