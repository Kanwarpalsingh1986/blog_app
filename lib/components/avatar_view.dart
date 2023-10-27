import 'package:flutter/material.dart';
import 'package:music_streaming_mobile/helper/common_import.dart';

class AvatarView extends StatelessWidget {
  final String? url;
  final double? size;
  final Color? borderColor;

  const AvatarView(
      {Key? key, required this.url, this.size = 60, this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size!,
      child: url != null
          ? CachedNetworkImage(
              imageUrl: url!,
              fit: BoxFit.cover,
              placeholder: (context, url) => SizedBox(
                  height: 20,
                  width: 20,
                  child: const CircularProgressIndicator().p8),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ).round(18).p(2)
          : Image.asset(
              'assets/user.png',
              color: Theme.of(context).primaryColor,
            ).p8,
    ).borderWithRadius(
        value: 2,
        radius: 20,
        color: borderColor ?? Theme.of(context).primaryColor,
        context: context);
  }
}

class UserAvatarView extends StatelessWidget {
  final UserModel user;
  final double? size;

  const UserAvatarView({Key? key, required this.user, this.size = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size!,
      child: user.image != null
          ? CachedNetworkImage(
              imageUrl: user.image!,
              fit: BoxFit.cover,
              placeholder: (context, url) =>  SizedBox(
                  height: 20, width: 20, child: const CircularProgressIndicator().p8),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ).round(15).p(2)
          : Center(
              child: Text(
                user.getInitials,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: Theme.of(context).primaryColor),
              ).p8,
            ),
    ).borderWithRadius(
        value: 2,
        radius: 18,
        color: Theme.of(context).primaryColor,
        context: context);
  }
}
