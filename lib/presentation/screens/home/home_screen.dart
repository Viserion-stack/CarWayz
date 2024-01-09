import 'package:car_wayz/data/comunity_controller.dart';
import 'package:car_wayz/export.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../friends/provider/comunity_provider.dart';
import 'widgets/animated_image_widget.dart';
import 'widgets/right_panel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static Page<void> page() => const MaterialPage<void>(child: HomeScreen());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final name = ref.watch(homeProvider).name;

    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('All Cars screen',
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: context.palette.textOnPrimaryColor)),
          ),
          ref.watch(allCommunitiesProvider).when(
              data: (communities) => Expanded(
                    child: CarouselSlider.builder(
                      itemCount: communities.length,
                      itemBuilder: (context, index, int pageViewIndex) {
                        return GestureDetector(
                          onTap: () {
                            ref.read(communityNameProvider.notifier).update(
                                (state) => state = communities[index].name);
                            ref.read(dashboardProvider.notifier).update(
                                (state) =>
                                    state = DashboardState.communityDetail);
                          },
                          child: Stack(
                            children: [
                              Animatedimage(
                                artId: communities[index].id,
                                imageUrl: communities[index].banner,
                                pageIndex: index,
                              ),
                              Positioned(
                                bottom: 100,
                                right: 7,
                                child: RightPanel(
                                  community: communities[index],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {},
                        height: double.infinity,
                        enableInfiniteScroll: false,
                        initialPage: 0,
                        autoPlayInterval: const Duration(seconds: 10),
                        autoPlay: true,
                        scrollDirection: Axis.vertical,
                        enlargeCenterPage: false,
                        viewportFraction: 1,
                      ),
                    ),
                  ),
              error: (error, stackTrace) => Text(
                    'Error while loading: ${error.toString()}',
                    style: const TextStyle(color: Colors.white),
                  ),
              loading: () => const CircularProgressIndicator.adaptive())
        ],
      ),
    );
  }
}
