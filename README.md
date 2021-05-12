[![Netlify Status](https://api.netlify.com/api/v1/badges/18f570a1-97f9-4e64-be23-f9b26ebf1279/deploy-status)](https://app.netlify.com/sites/compassionate-chandrasekhar-dfa50c/deploys)

# Info

fluttervancouver.ca using Flutter Web. The repo is not configured for other platforms, if you test the navigation might fail.

# Test

From your terminal run ```flutter run -d chrome --web-renderer html```. We use the html renderer instead of the default canvas as canvas adds 2mb to the website.

# Deploy

The builds are automatic from the ```master``` branch. Netlify site gets a notification when a new commit is added to the ```master``` branch and the following commands are run:

```
if cd flutter; then git pull && cd ..; else git clone https://github.com/flutter/flutter.git; fi && flutter/bin/flutter config --enable-web && flutter/bin/flutter build web --release --web-renderer html;ls -l;cp netlify.toml build/web/netlify.toml;
```

So the command loads Flutter, builds the web release version, copies the netlify config.
