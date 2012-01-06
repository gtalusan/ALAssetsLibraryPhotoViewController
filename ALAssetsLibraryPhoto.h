#import <UIKit/UIKit.h>
#import "EGOPhotoSource.h"

@interface ALAssetsLibraryPhoto : NSObject <EGOPhoto>

@property (nonatomic, strong) ALAsset *asset;

@end

