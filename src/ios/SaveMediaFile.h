#import <Cordova/CDVPlugin.h>

@interface SaveMediaFile : CDVPlugin {
	NSString* callbackId;
}

@property (nonatomic, copy) NSString* callbackId;

- (void)saveMediaFileToGallery:(CDVInvokedUrlCommand*)command;

@end
