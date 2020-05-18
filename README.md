# Info

fluttervancouver.ca using Flutter Web. Currently in beta stage.

# Test

Switch flutter channel to ```beta``` and then run ```flutter run -d chrome```.

# Deploy

Build locally using ```flutter build web``` and add the ```build``` contents to the commit. Once the code is pushed to Github repo, Netlify will trigger a build and deploy the changes from the ```build/web``` folder.
