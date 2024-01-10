import 'package:car_wayz/data/comunity_controller.dart';
import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/screens/friends/provider/comunity_provider.dart';

class FriendsScreen extends ConsumerWidget {
  static Page<void> page() => const MaterialPage<void>(child: FriendsScreen());
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.palette.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Friends screen',
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: context.palette.textOnPrimaryColor),
            ),
          ),
          ref.watch(userCommunitiesProvider).when(
                data: (communities) => Expanded(
                  child: ListView.builder(
                    itemCount: communities.length,
                    itemBuilder: (context, index) {
                      final community = communities[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(community.avatar),
                        ),
                        title: Text(community.name),
                        onTap: () {
                          ref.read(communityNameProvider.notifier).update(
                              (state) => state = communities[index].name);
                          // ref.read(dashboardProvider.notifier).update(
                          //     (state) =>
                          //         state = DashboardState.communityDetail);
                        },
                      );
                    },
                  ),
                ),
                error: (error, stackTrace) =>
                    Text('Error while loading: ${error.toString()}'),
                loading: () => const CircularProgressIndicator.adaptive(),
              )
        ],
      ),
    );
  }
}
