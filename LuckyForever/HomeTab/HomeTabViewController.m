//
//  HomeTabViewController.m
//  一路发
//
//  Created by 姚远 on 12/11/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import "HomeTabViewController.h"
#import "HomeTabTopCollectionViewCell.h"
#import "LotteryDetailViewController.h"
#import "LotteryData.h"
#import "CYCalendarHandler.h"

@interface HomeTabViewController ()

@end

@implementation HomeTabViewController{
    NSArray * buttons;
    NSDictionary * pool;
    UIImageView * imagePool;
    UILabel * titlePool;
    UILabel * descPool;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    buttons = [LotteryData getLotteryList];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    if (collectionView.tag == 1) {
        return 1;
    }
    if (collectionView.tag == 2) {
        return 1;
    }
    return 0;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView.tag == 1) {
        if (section == 0) {
            return 2;
        }
    }
    if (collectionView.tag == 2) {
        if (section == 0) {
            return 12;
        }
    }
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView.tag == 1) {
        HomeTabTopCollectionViewCell * cell = (HomeTabTopCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"topCell" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                cell.contentImageView.image = [UIImage imageNamed:@"top_content_0"];
            }
            if (indexPath.row == 1) {
                cell.contentImageView.image = [UIImage imageNamed:@"top_content_1"];
            }
        }
        return cell;
    }
    if (collectionView.tag == 2) {
        UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bottomCell" forIndexPath:indexPath];
        for(UIView * subview in cell.subviews){
            [subview removeFromSuperview];
        }
        imagePool = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, cell.bounds.size.width - 24, cell.bounds.size.width -24)];
        imagePool.image = [UIImage imageNamed:[NSString stringWithFormat:@"butt_%ld.png",(long)indexPath.item]];
        [cell addSubview:imagePool];
        
        pool = [buttons objectAtIndex:indexPath.item];
        
        titlePool = [[UILabel alloc] initWithFrame:[self configTitleLabelRectWithCell:cell]];
        [titlePool setFont: [UIFont systemFontOfSize:12]];
        [titlePool setTextAlignment:NSTextAlignmentCenter];
        titlePool.text = [pool objectForKey:@"title"];
        [cell addSubview:titlePool];
        
        descPool = [[UILabel alloc] initWithFrame:[self configDescLabelRectWithCell:cell]];
        [descPool setFont:[UIFont systemFontOfSize:11]];
        [descPool setTextAlignment:NSTextAlignmentCenter];
        [descPool setTextColor:[UIColor lightGrayColor]];
        descPool.text = [pool objectForKey:@"desc"];
        [cell addSubview:descPool];
        
        
        return cell;
    }
    return nil;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGSize size = CGSizeMake(0,0);
    if (collectionView.tag == 1) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        size = CGSizeMake(screenWidth, 158);
    }
    if (collectionView.tag == 2) {
        CGRect screenRect = self.bottomContentView.bounds;
        CGFloat screenWidth = screenRect.size.width;
        float cellWidth = screenWidth / 4.0; //Replace the divisor with the column count requirement. Make sure to have it in float.
        float cellHeight = cellWidth + 45;
        size = CGSizeMake(cellWidth, cellHeight);
    }
    return size;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView.tag == 1) {
                NSDictionary * dict = @{
                                        @"title":@"大红鹰打折",
                                        @"start_date":[NSDate dateWithTimeIntervalSinceNow:200],
                                        @"end_date":[NSDate dateWithTimeIntervalSinceNow:6000]
                                        };
                [CYCalendarHandler addCalendarEvent:dict];
        //NSLog(@"I am here");
        
        
    }
    
    if (collectionView.tag == 2) {
        pool = [buttons objectAtIndex:indexPath.item];
        [self performSegueWithIdentifier:@"toLotteryDetail" sender:self];
        
    }
}
-(CGRect) configTitleLabelRectWithCell:(UICollectionViewCell *) cell{
    float cell_width = cell.bounds.size.width;
    float label_width = cell_width -16;
    //float label_height = (cell_height - cell_width - 13)/2;
    float label_y = cell_width;
    return CGRectMake(8, label_y, label_width, 16);
}
-(CGRect) configDescLabelRectWithCell:(UICollectionViewCell *) cell{
    float cell_height = cell.bounds.size.height;
    float cell_width = cell.bounds.size.width;
    float label_width = cell_width -16;
    //float label_height = (cell_height - cell_width - 13)/2;
    float label_y = cell_width + (cell_height - cell_width - 13)/2 + 2;
    return CGRectMake(8, label_y, label_width, 16);
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"toLotteryDetail"]) {
        LotteryDetailViewController * ldvc = (LotteryDetailViewController *)[segue destinationViewController];
        ldvc.strURL = [pool objectForKey:@"websitePage"];
    }
    
}


@end
