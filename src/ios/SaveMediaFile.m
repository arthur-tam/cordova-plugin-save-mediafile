#import "SaveMediaFile.h"
#import <Cordova/CDV.h>

@implementation SaveMediaFile
@synthesize callbackId;

- (void)saveMediaFileToGallery:(CDVInvokedUrlCommand*)command {
  [self.commandDelegate runInBackground:^{
    self.callbackId = command.callbackId;

    NSString *srcAbsolutePath = [command.arguments objectAtIndex:0];
    NSString *fileEXT = [srcAbsolutePath substringFromIndex: [srcAbsolutePath length] - 3];

    NSLog(@"Absolute path: %@", srcAbsolutePath);

    NSArray *videoType = @[ @"mp4", @"m4v" ];
    if ([videoType containsObject: fileEXT]) {
      if ( !UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(srcAbsolutePath)) {
        NSLog(@"Video not compatiable");
        CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR messageAsString:@"Video not compatible"];
        [self.commandDelegate sendPluginResult:result callbackId:self.callbackId];
      } else {
        UISaveVideoAtPathToSavedPhotosAlbum(srcAbsolutePath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
      }
    } else {
      UIImage *image = [UIImage imageWithContentsOfFile:srcAbsolutePath];
      UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
  }];
}

- (void)dealloc {
  [callbackId release];
  [super dealloc];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
  // Was there an error?
  if (error != NULL) {
    NSLog(@"SaveMediaFile, error: %@",error);
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR messageAsString:error.description];
    [self.commandDelegate sendPluginResult:result callbackId:self.callbackId];
  } else {
    // No errors

    // Show message image successfully saved
    NSLog(@"SaveImage, image saved");
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK messageAsString:@"Image saved"];
    [self.commandDelegate sendPluginResult:result callbackId:self.callbackId];
  }
}

- (void) video: (NSString *) videoPath didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo {
  // Was there an error?
  if (error != NULL) {
    NSLog(@"SaveMediaFile, error: %@",error);
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR messageAsString:error.description];
    [self.commandDelegate sendPluginResult:result callbackId:self.callbackId];
  } else {
    // No errors

    // Show message video successfully saved
    NSLog(@"SaveMediaFile, video saved");
    CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK messageAsString:@"Video saved"];
    [self.commandDelegate sendPluginResult:result callbackId:self.callbackId];
  }
}

@end
