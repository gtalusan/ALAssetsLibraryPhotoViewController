#import "ALAssetsLibraryPhotoSource.h"
#import "ALAssetsLibraryPhoto.h"

@implementation ALAssetsLibraryPhotoSource

@synthesize cache;

- (id)initWithAssets:(NSArray *)assets
{
	self = [super init];
	self.cache = [NSCache new];
	[self.cache setCountLimit:4];
	
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
		id o = [cache objectForKey:photo];
		if (o == nil) {
			ALAssetRepresentation *representation = photo.asset.defaultRepresentation;
			CGImageRef imageRef = representation.fullScreenImage;
			o = [UIImage imageWithCGImage:imageRef scale:representation.scale orientation:(UIImageOrientation) representation.orientation];
			[cache setObject:o forKey:photo];
		}
		photo.image = o;
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

@end



