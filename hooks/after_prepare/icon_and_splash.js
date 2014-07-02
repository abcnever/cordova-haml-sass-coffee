#!/usr/bin/env node

//
// This hook copies various resource files
// from our version control system directories
// into the appropriate platform specific location
//


// configure all the files to copy.
// Key of object is the source file,
// value is the destination location.
// It's fine to put all platforms' icons
// and splash screen files here, even if
// we don't build for all platforms
// on each developer's box.

var filestocopy = [{
    "./icon/android/icon-48-mdpi.png":
    "./platforms/android/res/drawable/icon.png"
}, {
    "./icon/android/icon-72-hdpi.png":
    "./platforms/android/res/drawable-hdpi/icon.png"
}, {
    "./icon/android/icon-36-ldpi.png":
    "./platforms/android/res/drawable-ldpi/icon.png"
}, {
    "./icon/android/icon-48-mdpi.png":
    "./platforms/android/res/drawable-mdpi/icon.png"
}, {
    "./icon/android/icon-96-xhdpi.png":
    "./platforms/android/res/drawable-xhdpi/icon.png"
}, {
    "./screen/android/screen-hdpi-portrait.png":
    "./platforms/android/res/drawable/splash.png"
}, {
    "./screen/android/screen-hdpi-portrait.png":
    "./platforms/android/res/drawable-hdpi/splash.png"
}, {
    "./screen/android/screen-ldpi-portrait.png":
    "./platforms/android/res/drawable-ldpi/splash.png"
}, {
    "./screen/android/screen-mdpi-portrait.png":
    "./platforms/android/res/drawable-mdpi/splash.png"
}, {
    "./screen/android/screen-xhdpi-portrait.png":
    "./platforms/android/res/drawable-xhdpi/splash.png"
}, {
    "./screen/ios/Default-568h@2x~iphone.png":
    "./platforms/ios/KingsList/Resources/splash/Default-568h@2x~iphone.png"
}, {
    "./screen/ios/Default-Landscape@2x~ipad.png":
    "./platforms/ios/KingsList/Resources/splash/Default-Landscape@2x~ipad.png"
}, {
    "./screen/ios/Default-Landscape~ipad.png":
    "./platforms/ios/KingsList/Resources/splash/Default-Landscape~ipad.png"
}, {
    "./screen/ios/Default-Portrait@2x~ipad.png":
    "./platforms/ios/KingsList/Resources/splash/Default-Portrait@2x~ipad.png"
}, {
    "./screen/ios/Default-Portrait~ipad.png":
    "./platforms/ios/KingsList/Resources/splash/Default-Portrait~ipad.png"
}, {
    "./screen/ios/Default@2x~iphone.png":
    "./platforms/ios/KingsList/Resources/splash/Default@2x~iphone.png"
}, {
    "./screen/ios/Default~iphone.png":
    "./platforms/ios/KingsList/Resources/splash/Default~iphone.png"
}, {
    "./icon/ios/icon-40.png":
    "./platforms/ios/KingsList/Resources/icons/icon-40.png"
}, {
    "./icon/ios/icon-40@2x.png":
    "./platforms/ios/KingsList/Resources/icons/icon-40@2x.png"
}, {
    "./icon/ios/icon-50.png":
    "./platforms/ios/KingsList/Resources/icons/icon-50.png"
}, {
    "./icon/ios/icon-50@2x.png":
    "./platforms/ios/KingsList/Resources/icons/icon-50@2x.png"
}, {
    "./icon/ios/icon-60.png":
    "./platforms/ios/KingsList/Resources/icons/icon-60.png"
}, {
    "./icon/ios/icon-60@2x.png":
    "./platforms/ios/KingsList/Resources/icons/icon-60@2x.png"
}, {
    "./icon/ios/icon-72.png":
    "./platforms/ios/KingsList/Resources/icons/icon-72.png"
}, {
    "./icon/ios/icon-72@2x.png":
    "./platforms/ios/KingsList/Resources/icons/icon-72@2x.png"
}, {
    "./icon/ios/icon-76.png":
    "./platforms/ios/KingsList/Resources/icons/icon-76.png"
}, {
    "./icon/ios/icon-76@2x.png":
    "./platforms/ios/KingsList/Resources/icons/icon-76@2x.png"
}, {
    "./icon/ios/icon-small.png":
    "./platforms/ios/KingsList/Resources/icons/icon-small.png"
}, {
    "./icon/ios/icon-small@2x.png":
    "./platforms/ios/KingsList/Resources/icons/icon-small@2x.png"
}, {
    "./icon/ios/icon.png":
    "./platforms/ios/KingsList/Resources/icons/icon.png"
}, {
    "./icon/ios/icon@2x.png":
    "./platforms/ios/KingsList/Resources/icons/icon@2x.png"
}, ];

var fs = require('fs');
var path = require('path');

// no need to configure below
var rootdir = process.argv[2];

console.log(JSON.stringify(process.argv))

filestocopy.forEach(function(obj) {
    Object.keys(obj).forEach(function(key) {
        var val = obj[key];
        var srcfile = path.join(rootdir, key);
        var destfile = path.join(rootdir, val);

        // console.log("copying "+srcfile+" to "+destfile);
        var destdir = path.dirname(destfile);
        if (fs.existsSync(srcfile) && fs.existsSync(destdir)) {
            fs.createReadStream(srcfile).pipe(
               fs.createWriteStream(destfile));
        }
    });
});
