import 'package:car_wayz/data/model/community_model.dart';
import 'package:car_wayz/presentation/screens/home/widgets/animated_image_widget.dart';
import 'package:car_wayz/presentation/screens/home/widgets/right_panel.dart';
import 'package:flutter/material.dart';

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({
    required this.onTap,
    required this.community,
    required this.index,
    super.key,
  });

  final Function()? onTap;
  final Community community;
  final int index;

  static const _positionedBottom = 100.0;
  static const _positionedRight = 7.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Animatedimage(
            artId: community.id,
            imageUrl: community.banner,
            pageIndex: index,
          ),
          Positioned(
            bottom: _positionedBottom,
            right: _positionedRight,
            child: RightPanel(
              community: community,
            ),
          ),
        ],
      ),
    );
  }
}
