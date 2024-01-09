import 'package:car_wayz/data/auth_controller.dart';
import 'package:car_wayz/data/comunity_controller.dart';

import '../../../export.dart';
import 'provider/comunity_provider.dart';

class CommunityScreen extends ConsumerStatefulWidget {
  const CommunityScreen({super.key});

  static Page<void> page() {
    return const MaterialPage<void>(child: CommunityScreen());
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CommunityScreenState();
}

class _CommunityScreenState extends ConsumerState<CommunityScreen> {
  String communityName = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    communityName = ref.watch(communityNameProvider);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider)!;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            ref
                .read(dashboardProvider.notifier)
                .update((state) => state = DashboardState.home);
          },
        ),
      ),
      body: ref.watch(getCommunityByNameProvider(communityName)).when(
            data: (community) => Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: OutlinedButton(
                      onPressed: () {},
                      child: community.members.contains(user.uid)
                          ? const Text('Joint this community')
                          : const Text('Leave this community')),
                ),
                const Text('Community detail Screen.'),
                SizedBox(height: 100, child: Image.network(community.avatar)),
                Expanded(child: Image.network(community.banner)),
                Text(community.name),
                const Text('Posts:'),
                const Text('Posts #1:'),
                const Text('Posts:#2:'),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
            error: (error, stacTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator.adaptive(),
          ),
    );
  }
}
