#import <UIKit/UIKit.h>
#import "EGOPhotoSource.h"

@interface ALAssetsLibraryPhotoSource : NSObject <EGOPhotoSource>
{
	NSArray *_photos;
}

@property (nonatomic, strong) NSCache *cache;

- (id)initWithAssets:(NSArray *)assets;
- (id<EGOPhoto>)photoAtIndex:(NSInteger)index;

@end


