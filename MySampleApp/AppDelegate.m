
#import <GenSolutions/GenSolutions.Api.ImageMagick/ImageMagick.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [ImageMagick initImageMagick];

    return YES;
}
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application {

    [ImageMagick deInitImageMagick];
}

@end
