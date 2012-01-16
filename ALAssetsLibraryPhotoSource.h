#import <UIKit/UIKit.h>
#import "EGOPhotoSource.h"

@interface ALAssetsLibraryPhotoSource : NSObject <EGOPhotoSource, NSCacheDelegate>
{
	NSArray *_photos;
}

@property (nonatomic, strong) NSCache *cache;

- (id)initWithAssets:(NSArray *)assets;
- (id<EGOPhoto>)photoAtIndex:(NSInteger)index;

@end


