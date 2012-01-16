#import "ALAssetsLibraryPhotoSource.h"
#import "ALAssetsLibraryPhoto.h"

@implementation ALAssetsLibraryPhotoSource

@synthesize cache;

- (id)initWithAssets:(NSArray *)assets
{
	self = [super init];
	self.cache = [NSCache new];
	self.cache.delegate = self;
	self.cache.countLimit = 4;

	NSMutableArray *photos = [NSMutableArray new];
	for (ALAsset *asset in assets) {
		ALAssetsLibraryPhoto *photo = [ALAssetsLibraryPhoto new];
		photo.asset = asset;
		[photos addObject:photo];
	}
	_photos = photos;
	return self;
}

- (id<EGOPhoto>)photoAtIndex:(NSInteger)index
{
	ALAssetsLibraryPhoto *photo = [self.photos objectAtIndex:index];
	if (photo.image == nil) {
		ALAssetRepresentation *representation = photo.asset.defaultRepresentation;
		CGImageRef imageRef = representation.fullScreenImage;
		photo.image = [UIImage imageWithCGImage:imageRef scale:representation.scale orientation:(UIImageOrientation) [photo.asset valueForProperty:@"ALAssetPropertyOrientation"]];
		[cache setObject:photo forKey:[NSNumber numberWithInt:index]];
	}
	return photo;
}

- (NSArray *)photos
{
	return _photos;
}

- (NSInteger)numberOfPhotos
{
	return [self.photos count];
}

- (void)cache:(NSCache *)cache willEvictObject:(id)obj
{
	ALAssetsLibraryPhoto *photo = obj;
	photo.image = nil;
}

@end



