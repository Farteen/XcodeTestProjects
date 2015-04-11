//
//  BJLCollectionViewController.m
//  SpringyCollectionView
//
//  Created by Bryan Luby on 9/21/13.
//  Copyright (c) 2013 Bryan Luby. All rights reserved.
//

#import "BJLCollectionViewController.h"

@interface BJLCollectionViewController ()

@end

@implementation BJLCollectionViewController

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

@end
