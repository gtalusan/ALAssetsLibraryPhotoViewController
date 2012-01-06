#import <UIKit/UIKit.h>
#import "EGOPhotoViewController.h"

@interface ALAssetsLibraryPhotoViewController : EGOPhotoViewController

- (id)initWithAssets:(NSArray *)assets index:(int)index;

@property (nonatomic) int index;

@end
