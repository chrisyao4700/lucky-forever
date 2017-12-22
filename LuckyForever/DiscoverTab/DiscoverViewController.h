//
//  DiscoverViewController.h
//  一路发
//
//  Created by 姚远 on 12/13/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DiscoverViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *contentView;

@end
