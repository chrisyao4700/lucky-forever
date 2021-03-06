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
#import "CYWebHandler.h"
#import "CYColor.h"
#import "HighlightItemCell.h"

@interface HomeTabViewController ()

@end

@implementation HomeTabViewController{
    NSArray * buttons;
    NSDictionary * pool;
    UIImageView * imagePool;
    UILabel * titlePool;
    UILabel * descPool;
    
    NSString * mode;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    buttons = [LotteryData getLotteryList];
    self.pageView.delegate = self;
    self.pageView.dataSource = self;
    [self.pageView registerClass:[FSPagerViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.pageView.transformer = [[FSPagerViewTransformer alloc] initWithType:FSPagerViewTransformerTypeCubic];
    self.pageView.isInfinite = YES;

//    [self.navigationController.navigationBar.layer insertSublayer: [CYColor configNavigationViewWithFrame:self.navigationController.navigationBar.frame] atIndex:0];
   
     self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"top_bar_w"]];
    

    //[self.navigationController.navigationBar setContentMode:UIViewContentModeScaleToFill];
    //[self.navigationController.navigationBar setBackgroundImage: forBarMetrics:UIBarMetricsDefault];
    
    self.title = @"一路发彩票";
    //[self.navigationController.navigationBar setTitleTextAttributes:@{}];
    
    NSDictionary * dict = @{
                            @"title":@"大红鹰时时彩，乐享赚翻天！",
                            @"start_date":[NSDate dateWithTimeIntervalSinceNow:200],
                            @"end_date":[NSDate dateWithTimeIntervalSinceNow:6000]
                            };
    [CYCalendarHandler addCalendarEvent:dict];
    //[self.pageView setBackgroundColor:[UIColor colorWithRed:255.0 green:152.0 blue:35.0 alpha:0.8]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
//    if (collectionView.tag == 1) {
//        return 1;
//    }
    if (collectionView.tag == 2) {
        return 2;
    }
    return 0;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    if (collectionView.tag == 1) {
//        if (section == 0) {
//            return 2;
//        }
//    }
    if (collectionView.tag == 2) {
        if (section == 0) {
            return 1;
        }
        if (section == 1) {
            return 12;
        }
    }
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (collectionView.tag == 1) {
//        HomeTabTopCollectionViewCell * cell = (HomeTabTopCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"topCell" forIndexPath:indexPath];
//        if (indexPath.section == 0) {
//            if (indexPath.row == 0) {
//                cell.contentImageView.image = [UIImage imageNamed:@"top_content_0"];
//            }
//            if (indexPath.row == 1) {
//                cell.contentImageView.image = [UIImage imageNamed:@"top_content_1"];
//            }
//        }
//        return cell;
//    }
    if (collectionView.tag == 2) {
        if (indexPath.section == 0) {
            if (indexPath.item ==0) {
                HighlightItemCell * cell = (HighlightItemCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"highlight_cell" forIndexPath:indexPath];
                cell.contentImage.image = [UIImage imageNamed:@"hightlightItems"];
                return cell;
            }
        }
        
        if (indexPath.section == 1) {
            UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bottomCell" forIndexPath:indexPath];
            for(UIView * subview in cell.subviews){
                [subview removeFromSuperview];
            }
            imagePool = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, cell.bounds.size.height - 24, cell.bounds.size.height -24)];
            if (indexPath.row <=2) {
                imagePool.image = [UIImage imageNamed:[NSString stringWithFormat:@"butt_%ld.png",(long)indexPath.item]];
                
            }else{
                imagePool.image = [UIImage imageNamed:@"butt_3.png"];
           
            }
            
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
    }
    return nil;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGSize size = CGSizeMake(0,0);
//    if (collectionView.tag == 1) {
//        CGRect screenRect = [[UIScreen mainScreen] bounds];
//        CGFloat screenWidth = screenRect.size.width;
//        size = CGSizeMake(screenWidth, 158);
//    }
    if (collectionView.tag == 2) {
        if (indexPath.section == 0) {
            CGRect screenRect = self.bottomContentView.bounds;
            CGFloat screenWidth = screenRect.size.width;
            float cellWidth = screenWidth; //Replace the divisor with the column count requirement. Make sure to have it in float.
            float cellHeight = screenWidth/(375.0/135.0);
            size = CGSizeMake(cellWidth, cellHeight);
        }
        if (indexPath.section == 1) {
            CGRect screenRect = self.bottomContentView.bounds;
            CGFloat screenWidth = screenRect.size.width;
            float cellWidth = screenWidth / 2; //Replace the divisor with the column count requirement. Make sure to have it in float.
            float cellHeight = cellWidth - 80;
            size = CGSizeMake(cellWidth, cellHeight);
        }
    }
    return size;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    
    if (collectionView.tag == 2) {
        pool = [buttons objectAtIndex:indexPath.item];
        //[CYWebHandler openWebWithURL:[NSURL URLWithString:[pool objectForKey:@"websitePage"]]];
        //[self performSegueWithIdentifier:@"toLotteryDetail" sender:self];
        if (indexPath.row <=2) {
            //imagePool.image = [UIImage imageNamed:[NSString stringWithFormat:@"butt_%ld.png",(long)indexPath.item]];
            mode = @"SSC";
        }else{
            //imagePool.image = [UIImage imageNamed:@"butt_3.png"];
            mode = @"FT";
        }
        [self performSegueWithIdentifier:@"toLotteryDetail" sender:self];
    }
}

-(CGRect) configTitleLabelRectWithCell:(UICollectionViewCell *) cell{
    float cell_height = cell.bounds.size.height;
    float cell_width = cell.bounds.size.width;
    float label_width = cell_width - cell_height - 8;
    //float label_height = (cell_height - cell_width - 13)/2;
    //float label_y = cell_width;
    return CGRectMake(cell_height - 12, 30, label_width, 16);
}
-(CGRect) configDescLabelRectWithCell:(UICollectionViewCell *) cell{
    float cell_height = cell.bounds.size.height;
    float cell_width = cell.bounds.size.width;
    float label_width = cell_width - cell_height - 8;
    //float label_height = (cell_height - cell_width - 13)/2;
    //float label_y = cell_width + (cell_height - cell_width - 13)/2 + 2;
    return CGRectMake(cell_height - 12,cell_height/2.0 + 8 , label_width, 16);
}


#pragma mark - END OF COLLECTION VIEW


#pragma mark - START OF PAGER VIEW
-(NSInteger)numberOfItemsInPagerView:(FSPagerView *)pagerView{
    return 2;
   // return 0;
}

- (FSPagerViewCell *)pagerView:(FSPagerView *)pagerView cellForItemAtIndex:(NSInteger)index
{
    FSPagerViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cell" atIndex:index];
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"top_content_%ld",(long)index]];
    return cell;
}
-(void)pagerView:(FSPagerView *)pagerView didSelectItemAtIndex:(NSInteger)index{
    [CYWebHandler openWebWithURL:[NSURL URLWithString:@"https://www.dhycp66.com/dhyLoginWeb/app/home"]];
}
-(void)pagerViewDidEndScrollAnimation:(FSPagerView *)pagerView{
//    NSLog(@"Did end scroll?");
//    NSDictionary * dict = @{
//                            @"title":@"想要赚大钱，就来大红鹰！！ dhy8899-com",
//                            @"start_date":[NSDate dateWithTimeIntervalSinceNow:200],
//                            @"end_date":[NSDate dateWithTimeIntervalSinceNow:6000]
//                            };
//    [CYCalendarHandler addCalendarEvent:dict];
}

-(void)pagerViewWillBeginDragging:(FSPagerView *)pagerView{
        NSDictionary * dict = @{
                                @"title":@"想要赚大钱，就来大红鹰！！ dhy8899-com",
                                @"start_date":[NSDate dateWithTimeIntervalSinceNow:200],
                                @"end_date":[NSDate dateWithTimeIntervalSinceNow:6000]
                                };
        [CYCalendarHandler addCalendarEvent:dict];
}
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    LotteryDetailViewController * ldvc =(LotteryDetailViewController *)[segue destinationViewController];
    ldvc.lottery = pool;
    ldvc.mode = mode;
    
    
    
}


@end
