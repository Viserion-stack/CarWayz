import 'package:car_wayz/data/model/community_model.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';

import '../../../../data/auth_controller.dart';
import '../../../../data/comunity_controller.dart';
import '../../../../export.dart';
import '../../friends/provider/comunity_provider.dart';

class RightPanel extends ConsumerStatefulWidget {
  final Community community;
  const RightPanel({
    super.key,
    required this.community,
  });

  @override
  RightPanelState createState() => RightPanelState();
}

class RightPanelState extends ConsumerState<RightPanel> {
  late Community community;
  String communityName = '';

  @override
  void didChangeDependencies() {
    communityName = ref.watch(communityNameProvider);
    super.didChangeDependencies();
  }

  static const _panelWidth = 60.0;
  static const _panelHeight = 220.0;
  static const _likeButtonSize = 18.0;
  static const _panelCornerRadius = 30.0;
  static const _panelBacgroundOpacity = 0.4;

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider)!;

    return Container(
      width: _panelWidth,
      height: _panelHeight,
      decoration: BoxDecoration(
        color:
            context.palette.darkGrayColor.withOpacity(_panelBacgroundOpacity),
        borderRadius: BorderRadius.circular(_panelCornerRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LikeButtonWidget(
            size: _likeButtonSize,
            community: widget.community,
            uid: user.uid,
          ),
          Gap.medium,
          SaveButtonWidget(
            community: widget.community,
            uid: user.uid,
          ),
          Gap.medium,
          ShareWidgetButton(
            community: widget.community,
          ),
          const Text(
            'share', //context.strings.shareText,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class LikeButtonWidget extends ConsumerStatefulWidget {
  final Community community;
  final String? uid;
  const LikeButtonWidget(
      {super.key, required double size, required this.community, this.uid});

  @override
  LikeButtonWidgetState createState() => LikeButtonWidgetState();
}

class LikeButtonWidgetState extends ConsumerState<LikeButtonWidget> {
  // bool isLiked = false;
  // int likeCount = 0;
  static const _size = 35.0;

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      postFrameCallback: (state) async {
        // setState(() {
        //   if (widget.community.likes.contains(widget.uid ?? '')) {
        //     isLiked = true;
        //   } else {
        //     isLiked = false;
        //   }
        //   likeCount = widget.community.likes.length;
        // });
      },
      likeCountAnimationType: widget.community.likes.length > 999
          ? LikeCountAnimationType.none
          : LikeCountAnimationType.part,
      size: _size,
      isLiked: widget.community.likes.contains(widget.uid) ? true : false,
      likeCount: widget.community.likes.length,
      likeBuilder: (isLiked) {
        final color = isLiked ? Colors.red : Colors.white;
        return Icon(
          Icons.favorite,
          color: color,
          size: _size,
        );
      },
      countBuilder: (count, isLiked, text) {
        const color = Colors.white;

        return Text(
          NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
              .format(int.tryParse(text)),
          style: const TextStyle(
            color: color,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        );
      },
      countPostion: CountPostion.bottom,
      onTap: (isLiked) async {
        //likeCount += isLiked ? -1 : 1;
        //server request
        // context
        //     .read<ArtBloc>()
        //     .add(UpdateLikeCount(art: widget.art, newLikeCount: likeCount));

        ref
            .read(communityControllerProvider.notifier)
            .updateLikeCount(widget.community.name);

        return !isLiked;
      },
    );
  }
}

class SaveButtonWidget extends StatefulWidget {
  final Community community;
  final String? uid;

  const SaveButtonWidget({super.key, required this.community, this.uid});

  @override
  State<SaveButtonWidget> createState() => _SaveButtonWidgetState();
}

class _SaveButtonWidgetState extends State<SaveButtonWidget> {
  bool isSaved = false;
  int savedCount = 17;

  static const _saveButtonSize = 35.0;

  @override
  Widget build(BuildContext context) {
    return LikeButton(
      postFrameCallback: (state) async {
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // List<String> userList = prefs.getStringList('userSavedList') ?? [];
        setState(() {
          if (widget.community.saved.contains(widget.uid ?? '')) {
            isSaved = true;
          } else {
            isSaved = false;
          }
          savedCount = widget.community.saved.length;
        });
      },
      likeCountAnimationType: widget.community.likes.length > 999
          ? LikeCountAnimationType.none
          : LikeCountAnimationType.part,

      size: _saveButtonSize,
      isLiked: isSaved,
      likeCount: savedCount,
      likeBuilder: (isSaved) {
        final color = isSaved ? Colors.yellow : Colors.white;
        return Icon(
          isSaved ? Icons.bookmark_added_rounded : Icons.bookmark_add,
          color: color,
          size: _saveButtonSize,
        );
      },
      countBuilder: (count, isSaved, text) {
        const color = Colors.white;

        return Text(
          NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
              .format(int.tryParse(text)),
          style: const TextStyle(
            color: color,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        );
      },
      countPostion: CountPostion.bottom,
      //likeCountPadding: const EdgeInsets.only(left: 12),
      onTap: (isSaved) async {
        savedCount += isSaved ? -1 : 1;
        //server request
        // context
        //     .read<ArtBloc>()
        //     .add(UpdateSavedCount(art: widget.art, newSavedCount: savedCount));
        // if (!isSaved) {
        //   SnackbarHelper.showSnackBar(context, context.strings.addedToSaved);
        // }

        return !isSaved;
      },
    );
  }
}

class ShareWidgetButton extends StatefulWidget {
  final Community community;

  const ShareWidgetButton({super.key, required this.community});

  @override
  State<ShareWidgetButton> createState() => _ShareWidgetButtonState();
}

class _ShareWidgetButtonState extends State<ShareWidgetButton>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isimageError = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
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

  static const _shareButtonRadius = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37 + (_animation.value * 4),
      height: 37 + (_animation.value * 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_shareButtonRadius),
      ),
      child: ElevatedButton(
        onPressed: () {
          // ShareHelper.share(widget.art.name!, widget.art.imageUrl!);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          padding: EdgeInsets.zero,
        ),
        child: const Icon(
          Icons.ios_share_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
