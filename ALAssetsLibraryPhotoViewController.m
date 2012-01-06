#import "ALAssetsLibraryPhotoViewController.h"
#import "ALAssetsLibraryPhotoSource.h"

@implementation ALAssetsLibraryPhotoViewController

@synthesize index=_index;

- (id)initWithAssets:(NSArray *)assets index:(int)index;
{
	ALAssetsLibraryPhotoSource *source = [[ALAssetsLibraryPhotoSource alloc] initWithAssets:assets];
	self = [super initWithPhotoSource:source];
	self.index = index;
	return self;
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self moveToPhotoAtIndex:self.index animated:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
}

- (void)viewDidUnload
{
	[super viewDidUnload];
}

@end
