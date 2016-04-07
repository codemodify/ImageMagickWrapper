
#import <GenSolutions/GenSolutions.Api.ImageMagick/ImageMagick.h>

@implementation CameraViewController

#pragma mark ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
#pragma mark Helpers
#pragma mark ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----

- (NSString*) applicationDocumentsDirectory {

    NSArray* paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    
    NSString* basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : @"";
    
    return basePath;
}


#pragma mark ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----
#pragma mark Sample Magick Usage
#pragma mark ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----

-(void) doSomeMagickWithAnImage:(UIImage*)image {
    
    // Prepare full file names
    NSString* docsFolder = [self applicationDocumentsDirectory];
    NSString* inFile = [docsFolder stringByAppendingPathComponent:@"tempimage1.jpg"];
    NSString* outFile = [docsFolder stringByAppendingPathComponent:@"tempimage2.jpg"];
    
    // save the input image to disk because all the magick commands work with image files
    [UIImageJPEGRepresentation(image,1.0) writeToFile:inFile atomically:YES];

    // TEXTCLEANER (look on the net for these kind of commands)
    NSString* command01 = [NSString stringWithFormat:@"convert ( %@ -colorspace gray -type grayscale -contrast-stretch 0 ) ( -clone 0 -colorspace gray -negate -contrast-stretch 0 ) -compose copy_opacity -composite -fill white -opaque none +matte %@", 
                          inFile, outFile];

    // this is some nonsense just as example
    NSString* command02 = [NSString stringWithFormat:@"convert ( %@ -fill black -opaque none %@", 
                          outFile, inFile];

    // this is some different nonsense just as example
    NSString* command03 = [NSString stringWithFormat:@"convert ( %@ -fill red -opaque none %@", 
                          inFile, outFile];

    [ImageMagick convertImage:nil command:command01]; 
    [ImageMagick convertImage:nil command:command02]; 
    [ImageMagick convertImage:nil command:command03]; 

    // Do something with the resulted image ... load it and show it on some view ...
    UIImage* resultImage = [UIImage imageWithContentsOfFile:outFile];
}

@end

