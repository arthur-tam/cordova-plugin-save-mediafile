SaveMediaFile
=============

This plugin allows you to save media files to the iOS Camera Roll/Photo Library or Android Gallery.
The media file to be saved to the Library/Gallery must be available on the device.

The plugin is based on code seen in several other existing plugins:

1. cordova-plugin-save-image (https://github.com/quiply/SaveImage) by Quiply Technologies GmbH

Thanks to the above mentioned author for sharing their code openly.

    cordova plugin add cordova-plugin-save-mediafile

Methods
-------

- cordova.plugins.mediafilesaver.saveMediaFileToGallery

Properties
----------

none

# API reference

mediafilesaver.saveMediaFileToGallery
=====================================

Save a local media file to the device gallery / camera roll.

    cordova.plugins.mediafilesaver.saveMediaFileToGallery(nativePathToMediaFile, successCallback, errorCallback);

Supported Platforms
-------------------

- iOS, Android

Usage Example
--------------

Call the `window.cordova.plugins.mediafilesaver.saveMediaFileToGallery()` method passing 3 parameters: 1. The native path for the media file to be saved, 2. success callback, 3. error callback

### Example
```

// iOS with file prefix: var nativePathToJpegImage = 'file:///var/mobile/Containers/Data/Application/<UUID>/Library/NoCloud/some_dir/some_image.jpg'
// iOS without file prefix: var nativePathToJpegImage = '/var/mobile/Containers/Data/Application/<UUID>/Library/NoCloud/some_dir/some_image.jpg'
// Android with file prefix: var nativePathToJpegImage = 'file:///data/data/<package_name>/files/some_dir/some_image.jpg'
// Android without file prefix: var nativePathToJpegImage = '/data/data/<package_name>/files/some_dir/some_image.jpg'

window.cordova.plugins.mediafilesaver.saveMediaFileToGallery(nativePathToMediaFile, onSaveSuccess, onSaveError);
                                            
function onSaveSuccess() {
    console.log('--------------success');
}
                                            
function onSaveError(error) {
    console.log('--------------error: ' + error);
}
```

## License

The MIT License

Copyright (c) 2016 Quiply Technologies GmbH (http://www.quiply.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
