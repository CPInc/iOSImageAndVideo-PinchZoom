//
//  DetailedViewController.m
//  Video Zoom
//
//  Created by Danny Witters on 05/10/2014.
//  Copyright (c) 2014 CaptureProof. All rights reserved.
//

#import "DetailedViewController.h"

#import "ImageWithZoom.h"
#import "VideoWithZoom.h"

@interface DetailedViewController ()

@property (strong, nonatomic) VideoWithZoom *video;
@property (strong, nonatomic) ImageWithZoom *image;
@property (strong, nonatomic) NSDictionary *mediaData;

@end

@implementation DetailedViewController

#pragma mark View Initializer

- (id)initWithData:(NSDictionary*)info{
    
    self = [super init];
    
    if (self){
        
        self.mediaData = info;
    
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -12;
        
        UIImage *backButtonImage = [UIImage imageNamed:@"back.png"];
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.adjustsImageWhenHighlighted = NO;
        [backButton setImage:backButtonImage forState:UIControlStateNormal];
        backButton.frame = CGRectMake(0.0f, 0.0f, 44.0f, 44.0f);
        backButton.imageEdgeInsets = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
        
        [backButton addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchUpInside];

        UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,backButtonItem, nil];

    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    if ([self.mediaData[@"fileType"] isEqual:@"Video"])
    {
        self.navigationItem.title = @"VIDEO";
        
        self.video = [[VideoWithZoom alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height) andVideoName:self.mediaData[@"fileName"] andFileType:self.mediaData[@"fileFormat"]];
        [self.view addSubview:self.video];
    }
    else if ([self.mediaData[@"fileType"] isEqual:@"Image"])
    {
        
        self.navigationItem.title = @"IMAGE";
        
        self.image = [[ImageWithZoom alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height) andImage:[UIImage imageNamed:self.mediaData[@"fileName"]]];
        [self.view addSubview:self.image];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithRed:64.0/255.0f green:64.0/255.0f blue:64.0/255.0f alpha:1.0f]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
}

#pragma mark Button Methods

- (void)goBack:(UIButton*)sender{
    
    if (self.video)
    {
        [self.video stopVideo];
        [self.video removeFromSuperview];
    }
    
    if (self.image)
    {
        [self.image removeFromSuperview];
    }
    
    [self.navigationController popViewControllerAnimated:NO];
}

@end
