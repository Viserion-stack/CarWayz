import 'package:car_wayz/data/comunity_controller.dart';
import 'package:car_wayz/export.dart';
import 'package:car_wayz/presentation/common/app_localizations.dart';

import '../../../data/auth_controller.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});
  static Page<void> page() => const MaterialPage<void>(child: ProfileScreen());

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final communityNameController = TextEditingController();
  int chars = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    communityNameController.dispose();
  }

  void updateMaxChar(int charsCount) {
    setState(() {
      chars = charsCount;
    });
  }

  void createCommunity() {
    bool isValid = _formKey.currentState!.validate();

    if (isValid) {
      ref
          .read(communityControllerProvider.notifier)
          .createCommunity(communityNameController.text.trim(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final isLoading = ref.watch(communityControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.strings.profileSettingsText,
          style: const TextStyle(color: Colors.yellow),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundImage: NetworkImage(user?.profilePic ?? ''),
                onBackgroundImageError: (exception, stackTrace) =>
                    const CircleAvatar(
                  backgroundImage: NetworkImage(Constants.avatarDefault),
                ),
              ))
        ],
      ),
      backgroundColor: context.palette.primaryColor,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.strings.createCommunityText,
                style: const TextStyle(color: Colors.yellow),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0, 0.5, 1],
                    colors: <Color>[
                      Colors.black12,
                      Colors.black,
                      Colors.black12
                    ],
                  ),
                ),
                child: TextFormField(
                  onTap: () {},
                  controller: communityNameController,
                  autofocus: true,
                  maxLength: 25,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  //maxLengthEnforcement: MaxLengthEnforcement.none,
                  onChanged: (value) {
                    if (communityNameController.text.length <= 1) {
                      if (_formKey.currentState!.validate()) {}
                      _formKey.currentState!.save();
                    }
                    updateMaxChar(communityNameController.text.length);
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                  ),
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  '$chars/25 Characters',
                  style: const TextStyle(color: Colors.yellow),
                ),
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        createCommunity();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: context.palette.accentColor),
                      child: Text(context.strings.create),
                    ),
              Gap.large,
              Text(
                context.strings.profileSettingsText,
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: context.palette.textOnPrimaryColor),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(authProvider.notifier).logout();
                  ref
                      .read(dashboardProvider.notifier)
                      .update((state) => state = DashboardState.home);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: context.palette.accentColor),
                child: Text(context.strings.signOut),
              )
            ],
          ),
        ),
      ),
    );
  }
}
