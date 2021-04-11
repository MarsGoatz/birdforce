import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vancouver/common/style_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AboutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var breakPoint = 1000;
    Axis direction = MediaQuery.of(context).size.width < breakPoint
        ? Axis.vertical
        : Axis.horizontal;
    FlexFit fit = MediaQuery.of(context).size.width < breakPoint
        ? FlexFit.loose
        : FlexFit.tight;

    var separtorWidth = MediaQuery.of(context).size.width < breakPoint ? 0 : 20;
    var separtorHeight =
        MediaQuery.of(context).size.width < breakPoint ? 50 : 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('About',
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'JosefinSans', fontSize: 40)),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Flutter Vancouver was created by Siddharth Molleti after falling in love with Flutter and his interest for creating a community and empowering others came together. In addition to being a speaker, Sid actively maintains and organizes events in the community. The next person to make an impact in the group is Boris Schneiderman. Boris has been involved since the beginning and is the Gandalf of our group. On top of having high standards for teaching others, he also actively helps when someone has a query. The group is very lucky to have him. Next up is Lu Tang, Lu is a self learner and has no background on programming and picked up Flutter to kick start her career in tech and now is actively a Flutter developer. She is truly an inspiration for women out there. All of us live and work in Vancouver.',
          style: StyleConstants.kDefaultTextStyle,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Center(
            child: Flex(
              mainAxisSize: MainAxisSize.min,
              direction: direction,
              children: [
                Flexible(
                    flex: 2,
                    fit: fit,
                    child: PersonDetails(
                      networkImageUrl:
                          "https://drive.google.com/uc?id=1Ez-5dNCvOFR2kCBocOvFqjBDSfZDQzRn",
                      name: 'Siddharth Molleti',
                      message: 'Software Developer',
                      twitterHandle: 'https://twitter.com/marsgoatzz',
                      linkedInHandle: 'https://www.linkedin.com/in/smllti',
                      email: 'sid.310@icloud.com',
                    )),
                Flexible(
                    flex: 1,
                    fit: fit,
                    child: SizedBox(
                      width: separtorWidth.toDouble(),
                      height: separtorHeight.toDouble(),
                    )),
                Flexible(
                    flex: 2,
                    fit: fit,
                    child: PersonDetails(
                      networkImageUrl:
                          "https://drive.google.com/uc?id=1L9phZvlJ-XYzbJ83i_3IAzhbptKqL5sv",
                      name: 'Boris Schneiderman',
                      message: 'Lead Frontend Developer',
                      linkedInHandle:
                          'https://www.linkedin.com/in/boris-schneiderman-14986721',
                      email: 'boris@bormind.com',
                    )),
                Flexible(
                    flex: 1,
                    fit: fit,
                    child: SizedBox(
                      width: separtorWidth.toDouble(),
                      height: separtorHeight.toDouble(),
                    )),
                Flexible(
                    flex: 2,
                    fit: fit,
                    child: PersonDetails(
                      networkImageUrl:
                          "https://drive.google.com/uc?id=15V0EinHezPj92VaFj2r6azWVLTQitKhL",
                      name: 'Lu Tang',
                      message: 'Flutter Developer',
                      twitterHandle: 'https://twitter.com/FlutterLulu',
                      linkedInHandle: 'https://www.linkedin.com/in/lutang123/',
                      email: 'lutang908@gmail.com',
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class GuestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var breakPoint = 1000;
    Axis direction = MediaQuery.of(context).size.width < breakPoint
        ? Axis.vertical
        : Axis.horizontal;
    FlexFit fit = MediaQuery.of(context).size.width < breakPoint
        ? FlexFit.loose
        : FlexFit.tight;

    var separtorWidth = MediaQuery.of(context).size.width < breakPoint ? 0 : 20;
    var separtorHeight =
        MediaQuery.of(context).size.width < breakPoint ? 50 : 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Guest Speakers',
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'JosefinSans', fontSize: 40)),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'A special mention to our speakers who take time off of their busy schedule to empower our Flutter Vancouver community.',
          style: StyleConstants.kDefaultTextStyle,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Center(
            child: Flex(
              mainAxisSize: MainAxisSize.min,
              direction: direction,
              children: [
                Flexible(
                    flex: 2,
                    fit: fit,
                    child: PersonDetails(
                      networkImageUrl:
                          "https://drive.google.com/uc?id=1Yif19fudTTJi-nUpvhEri1KoIdb0z6-S",
                      name: 'Fernando Rocha',
                      message: 'Solutions Architect, AWS Amplify, Amazon',
                      twitterHandle: 'https://twitter.com/rochatron',
                      email: 'fernandorsl@gmail.com',
                    )),
                Flexible(
                    flex: 1,
                    fit: fit,
                    child: SizedBox(
                      width: separtorWidth.toDouble(),
                      height: separtorHeight.toDouble(),
                    )),
                Flexible(
                    flex: 2,
                    fit: fit,
                    child: PersonDetails(
                      networkImageUrl:
                          "https://drive.google.com/uc?id=1JvVwW3VnS4Y5HreYgmoQJAB6bfRJ0PS8",
                      name: 'Kevin Moore',
                      message: 'Product Manager, Flutter & Darlang, Google',
                      twitterHandle: 'https://twitter.com/kevmoo',
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MentorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var breakPoint = 1000;
    Axis direction = MediaQuery.of(context).size.width < breakPoint
        ? Axis.vertical
        : Axis.horizontal;
    FlexFit fit = MediaQuery.of(context).size.width < breakPoint
        ? FlexFit.loose
        : FlexFit.tight;

    var separtorWidth = MediaQuery.of(context).size.width < breakPoint ? 0 : 20;
    var separtorHeight =
        MediaQuery.of(context).size.width < breakPoint ? 50 : 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Mentors',
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'JosefinSans', fontSize: 40)),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Thank you for the support and guiding us!',
          style: StyleConstants.kDefaultTextStyle,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Center(
            child: Flex(
              mainAxisSize: MainAxisSize.min,
              direction: direction,
              children: [
                Flexible(
                    flex: 2,
                    fit: fit,
                    child: PersonDetails(
                      networkImageUrl:
                          "https://drive.google.com/uc?id=136-JEUdAsELxbiYlfJaeaqAd_CM2f8Uf",
                      name: 'Ria Carmin',
                      message: 'Organizer, React Vancouver',
                      twitterHandle: 'https://twitter.com/RiaCarmin',
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PersonDetails extends StatelessWidget {
  final String networkImageUrl;
  final String message;
  final String name;
  final String twitterHandle;
  final String linkedInHandle;
  final String email;

  const PersonDetails({
    Key key,
    this.networkImageUrl,
    this.message,
    this.name,
    this.twitterHandle,
    this.linkedInHandle,
    this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        maxWidth: 500.0,
      ),
      child: Column(
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
                    child: CachedNetworkImage(
                      width: 100,
                      height: 100,
                      imageUrl: networkImageUrl,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                    ),
                  )
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage(networkImageUrl),
                  //   radius: 60,
                  // ),
                  )),
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
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (twitterHandle != null)
                TextButton(
                    onPressed: () => launch(twitterHandle),
                    child: Image.asset(
                      'social/twitter.png',
                      width: 32,
                      height: 32,
                    )),
              if (linkedInHandle != null)
                TextButton(
                    onPressed: () => launch(linkedInHandle),
                    child: Image.asset(
                      'social/linkedin.png',
                      width: 35,
                      height: 35,
                    )),
              if (email != null)
                TextButton(
                    child: Icon(
                      Icons.email,
                      size: 35,
                    ),
                    onPressed: () => launch('mailto:$email'))
            ],
          )
        ],
      ),
    );
  }
}
