var MediaFileSaver = function () {
};

MediaFileSaver.saveMediaFileToGallery = function (localMediaFilePath, successCallback, failureCallback) {
    if (typeof successCallback != 'function') {
        throw new Error('SaveMediaFile Error: successCallback is not a function');
    }

    if (typeof failureCallback != 'function') {
        throw new Error('SaveMediaFile Error: failureCallback is not a function');
    }

    return cordova.exec(
        successCallback, failureCallback, 'SaveMediaFile', 'saveMediaFileToGallery', [_getLocalMediaFilePathWithoutPrefix()]);

    function _getLocalMediaFilePathWithoutPrefix() {
        if (localMediaFilePath.indexOf('file:///') === 0) {
            return localMediaFilePath.substring(7);
        }
        return localMediaFilePath;
    }
};

module.exports = MediaFileSaver;
