#import "ALAssetsLibraryPhoto.h"

@implementation ALAssetsLibraryPhoto

@synthesize asset;
@synthesize failed;
@synthesize image;

- (NSString *)caption
{
	return nil;
}

- (NSURL *)URL
{
	ALAssetRepresentation *representation = self.asset.defaultRepresentation;
	return representation.url;
}

- (BOOL)didFail
{
	return NO;
}

@end


