# Deploy to Firebase Functions With Project targets

*Forked from chrissank/deploy-firebase-functions, updated to use node v16*

A GitHub Action to deploy to Firebase Functions that is able to deploy to different projects.  
Need to deploy to production on one branch, then to development on another? Specify a 'target' by using the <key, value> set in your `firebaserc` file. For example:

```
{
  "projects": {
    "default": "production project id",
    "development": "development project id"
  }
}
```

Then, specify a value (as inidicated below in the example workflow) or none for default.

### Example workflow

```
name: Firebase
on:
  push:
    branches:
    - master
jobs:
  main:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
    - name: Check out code
      uses: actions/checkout@master
    - name: Deploy to Firebase
      uses: gh-jir/deploy-firebase-functions@2.0.0
      env:
        FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
        TARGET: default
        RUN_NPM_CI: true
        RUN_NPM_BUILD: true
```

## Contribution

I am no longer actively maintaining this code, however, if bugs or issues arise, please make a pull request. Please try to maintain backwards compatibility where possible. 
