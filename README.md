# flutter_initial_template

This repository is intended to prevent you from unnecessary work and waste of time

## Getting Started

**1. At first you should clone this repo on your PC;**

**2. Then you have to rename package name:**
 
**On Android:**
  
 - Go to `build.gradle` in app module and rename`applicationId`;
 - Go to `AndroidManifest.xml` in `app/src/main` and rename package parameter;
 - Go to `AndroidManifest.xml` in `app/src/profile` and rename package parameter;
 - Go to `AndroidManifest.xml` in `app/src/debug` and rename package parameter;
 
**On IOS**
 
 - Open XCode and open the runner file and click on Runner in project explorer;
 - Go to General -> double click on Bundle Identifier -> rename it to com.company.name;
 - Go to `Info.plist` click on Bundle name -> rename it to your App Name.
 
- Then go to `pubspec.yaml` and change app name;
- Close everything -> go to your flutter project and run this command in terminal:
  
```sh
 flutter clean
```

**3. Run:**
```sh
git config --local core.hooksPath .githooks/
```
 
## P.S.

If your Git version is not at least 2.9.0, setting a hooks-path variable will have no effect at all. So, you have to update your Git as needed.