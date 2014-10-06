//
//  MainViewController.m
//  Video Zoom
//
//  Created by Danny Witters on 05/10/2014.
//  Copyright (c) 2014 CaptureProof. All rights reserved.
//

#import "CollectionViewCell.h"
#import "MainViewController.h"
#import "DetailedViewController.h"

@interface MainViewController ()

@property (strong, nonatomic) NSArray *data;

@end

@implementation MainViewController

static NSString * const reuseIdentifier = @"ReusableCell";

#pragma mark - View Initializer

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSString *plistData = [[NSBundle mainBundle] pathForResource:@"imageVideoData" ofType:@"plist"];
    self.data = [[NSArray alloc] initWithContentsOfFile:plistData];
    
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}

#pragma mark - Collection View

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [self.data count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cV cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    CollectionViewCell *cell = [cV dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.thumbnailImage setImage:[UIImage imageNamed:self.data[indexPath.row][@"fileThumbnail"]]];
    
    //DISPLAY PLAY BUTTON IF VIDEO
    if ([self.data[indexPath.row][@"fileType"] isEqualToString:@"Video"])
        cell.playButton.alpha = 1.0f;
    else
        cell.playButton.alpha = 0.0f;
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailedViewController *dVC = [[DetailedViewController alloc] initWithData:self.data[indexPath.row]];
    [self.navigationController pushViewController:dVC animated:NO];
}

@end
