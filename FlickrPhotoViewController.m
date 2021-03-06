//
//  FlickrPhotoViewController.m
//  FlickrSearch
//
//  Created by Yifeng Hou on 26/2/14.
//  Copyright (c) 2014 GraceHou. All rights reserved.
//

#import "FlickrPhotoViewController.h"
#import "Flickr.h"
#import "FlickrPhoto.h"

@interface FlickrPhotoViewController ()

@property (weak) IBOutlet UIImageView *imageView;
-(IBAction)done:(id) sender;

@end

@implementation FlickrPhotoViewController

- (IBAction)done:(id)sender {
    // TODO
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{}];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated {
    // 1
    if(self.flickrPhoto.largeImage) {
        self.imageView.image = self.flickrPhoto.largeImage;
    } else {
        // 2
        self.imageView.image = self.flickrPhoto.thumbnail;
        // 3
        [Flickr loadImageForPhoto:self.flickrPhoto thumbnail:NO completionBlock:^(UIImage *photoImage, NSError *error) {
            if(!error) { // 4
                dispatch_async(dispatch_get_main_queue(), ^{ self.imageView.image =
                    self.flickrPhoto.largeImage;
                });
            }
        }];
    }
}

@end
