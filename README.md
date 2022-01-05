[![Netlify Status](https://api.netlify.com/api/v1/badges/dcd7fe8f-631b-409e-b4c6-731f768ada25/deploy-status)](https://app.netlify.com/sites/lucid-villani-3c301a/deploys)

# License
One thing to note that all the code is under BSD-2 license ***except the assets***. If you have Canva Pro account, then you can reuse the assets too. For the social assets, please refer to the rules of the specific product, for example for twitter, checkout their brand rules and youtube, you will need to check theirs etc. 

I chose BSD-2 because Flutter uses BSD-2 too, could have chosen any license really.

# Info

flutterCanada.ca using Flutter Web. The repo is not configured for other platforms, if you test the navigation might fail.

# Test

## Devo

From your terminal run the following command. We use the html renderer instead of the default canvas as canvas adds 2mb to the website.

```console
flutter run -d chrome --web-renderer html
```

## Release

From your terimal run the following command. Feel free to change the port number as needed.

```console
flutter build web && cd build/web --web-renderer=html && (python -mSimpleHTTPServer &) && open http://localhost:8000/`
```

# Deploy

The builds are automatic from the ```master``` branch. Netlify site gets a notification when a new commit is added to the ```master``` branch and the following commands are run:

```console
if cd flutter; then git pull && cd ..; else git clone https://github.com/flutter/flutter.git; fi && flutter/bin/flutter config --enable-web && flutter/bin/flutter build web --release --web-renderer html;ls -l;cp netlify.toml build/web/netlify.toml;
```

So the command loads Flutter, builds the web release version, copies the netlify config and publishes build/web folder.
