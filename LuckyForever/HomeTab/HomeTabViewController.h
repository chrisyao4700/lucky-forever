//
//  HomeTabViewController.h
//  一路发
//
//  Created by 姚远 on 12/11/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTabViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong, nonatomic) IBOutlet UICollectionView *topContentView;
@property (strong, nonatomic) IBOutlet UICollectionView *bottomContentView;

@end
