import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonDetails extends StatelessWidget {
  final String? networkImageUrl;
  @required
  final String? message;
  @required
  final String? name;
  final String? twitterHandle;
  final String? linkedInHandle;
  final String? email;
  final String? webLink;
  final String? mediumLink;

  const PersonDetails(
      {Key? key,
      this.networkImageUrl,
      this.message,
      this.name,
      this.twitterHandle,
      this.linkedInHandle,
      this.email,
      this.webLink,
      this.mediumLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        maxWidth: 500.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
              constraints: new BoxConstraints(
                maxHeight: 300.0,
                maxWidth: 300.0,
              ),
              child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: new Border.all(
                      color: Colors.deepOrange,
                      width: 3.0,
                    ),
                  ),
                  child: ClipOval(
                    child: networkImageUrl != null
                        ? CachedNetworkImage(
                            width: 100,
                            height: 100,
                            imageUrl: networkImageUrl!,
                            placeholder: (context, url) {
                              return Icon(
                                Icons.person_rounded,
                                size: 80,
                                color: Colors.cyan,
                              );
                            },
                          )
                        : Icon(
                            Icons.person_rounded,
                            size: 100,
                            color: Colors.cyan,
                          ),
                  ))),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (twitterHandle != null)
                TextButton(
                    onPressed: () => launch(twitterHandle!),
                    child: Image.asset(
                      'assets/social/twitter.png',
                      width: 32,
                      height: 32,
                    )),
              if (linkedInHandle != null)
                TextButton(
                    onPressed: () => launch(linkedInHandle!),
                    child: Image.asset(
                      'assets/social/linkedin.png',
                      width: 35,
                      height: 35,
                    )),
              if (mediumLink != null)
                TextButton(
                    onPressed: () => launch(mediumLink!),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: Image.asset(
                        'assets/social/medium.png',
                        width: 31.5,
                        height: 31.5,
                      ),
                    )),
              if (email != null)
                TextButton(
                    child: Icon(
                      Icons.email,
                      size: 37,
                    ),
                    onPressed: () => launch('mailto:$email')),
              if (webLink != null)
                TextButton(
                    child: Icon(
                      Icons.web,
                      size: 37,
                      color: Colors.pink,
                    ),
                    onPressed: () => launch(webLink!)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            name ?? 'Placeholder',
            style: TextStyle(fontFamily: 'josefinsans', fontSize: 25),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            message ?? 'Placeholder',
            style: TextStyle(
                fontFamily: 'SourceCodePro',
                fontSize: 15,
                height: 1.3,
                color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
