[![Netlify Status](https://api.netlify.com/api/v1/badges/18f570a1-97f9-4e64-be23-f9b26ebf1279/deploy-status)](https://app.netlify.com/sites/compassionate-chandrasekhar-dfa50c/deploys)

# Info

fluttervancouver.ca using Flutter Web. Currently in beta stage.

# Test

Switch flutter channel to ```beta``` and then run ```flutter run -d chrome```.

# Deploy

Build locally using ```flutter build web``` and add the ```build``` contents to the commit. Once the code is pushed to Github repo, Netlify will trigger a build and deploy the changes from the ```build/web``` folder.
