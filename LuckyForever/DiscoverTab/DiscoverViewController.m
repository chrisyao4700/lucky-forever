//
//  DiscoverViewController.m
//  一路发
//
//  Created by 姚远 on 12/13/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverTitleCell.h"
#import "DiscoverContentCell.h"
#import "DiscoverSubtitleCell.h"
#import "DiscoverFooterCell.h"
#import "DiscoverData.h"
#import "DiscoverDetailViewController.h"
@interface DiscoverViewController ()

@end

@implementation DiscoverViewController{
     //DRPLoadingSpinner *spinner;
    NSArray * discoverData;
    
    NSArray * sitesPool;
    NSDictionary * sitePool;
    
    CGRect screenRect;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    screenRect = [[UIScreen mainScreen] bounds];
    
    discoverData = [DiscoverData getDiscoverData];
    
    //self.webView.navigationDelegate = self;
    
//    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    spinner = [[DRPLoadingSpinner alloc] initWithFrame:CGRectMake((screenRect.size.width/2)-25, (screenRect.size.height/2)-25, 50, 50)];
//    [self.view addSubview:spinner];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www-dahongying.cc/"]]];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 7;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger temp  = 0;
    if (section == 0) {
        //HEADER
        temp = 1;
    }
    if (section == 1) {
        //lottery
        temp = 1;
    }
    if (section == 2) {
        temp = 6;
    }
    if (section == 3) {
        //honor guests
        temp = 1;
    }
    if (section == 4) {
        temp = 6;
    }
    if (section == 5) {
        //putin
        temp = 1;
    }
    if (section == 6) {
        temp = 6;
    }
    if (section == 7) {
        //footer
        temp = 1;
    }
    return temp;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //header
        DiscoverTitleCell * cell = (DiscoverTitleCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"titleCell" forIndexPath:indexPath];
        cell.titleImageView.image = [UIImage imageNamed:@"discover_title"];
        return cell;
    }
    if (indexPath.section == 1 || indexPath.section == 3 || indexPath.section == 5) {
        DiscoverSubtitleCell * cell = (DiscoverSubtitleCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"subtitleCell" forIndexPath:indexPath];
        cell.backgroundImageView.image = [UIImage imageNamed:@"discover_subtitle_bg1"];
        if (indexPath.section == 1) {
            cell.backgroundImageView.image = [UIImage imageNamed:@"discover_subtitle_bg1"];
            //cell.subtitleLabel.text = [[discoverData objectAtIndex:0] objectForKey:@"subtitle"];
        }
        if (indexPath.section == 3) {
            cell.backgroundImageView.image = [UIImage imageNamed:@"discover_subtitle_bg2"];
            //cell.subtitleLabel.text = [[discoverData objectAtIndex:1] objectForKey:@"subtitle"];
        }
        if (indexPath.section == 5) {
            cell.backgroundImageView.image = [UIImage imageNamed:@"discover_subtitle_bg3"];
            //cell.subtitleLabel.text = [[discoverData objectAtIndex:2] objectForKey:@"subtitle"];
        }
        
        return cell;
    }
    if (indexPath.section == 2 || indexPath.section == 4 || indexPath.section == 6) {
        DiscoverContentCell * cell = (DiscoverContentCell *) [collectionView dequeueReusableCellWithReuseIdentifier:@"contentCell" forIndexPath:indexPath];
        cell.backgroundImageView.image = [UIImage imageNamed:@"discover_content_bg"];
        if (indexPath.section == 2) {
            sitesPool = [[discoverData objectAtIndex:0] objectForKey:@"sites"];
            sitePool = [sitesPool objectAtIndex:indexPath.item];
            cell.contentLabel.text = [sitePool objectForKey:@"siteName"];
        }
        if (indexPath.section == 4) {
            sitesPool = [[discoverData objectAtIndex:1] objectForKey:@"sites"];
            sitePool = [sitesPool objectAtIndex:indexPath.item];
            cell.contentLabel.text = [sitePool objectForKey:@"siteName"];
        }
        if (indexPath.section == 6) {
            sitesPool = [[discoverData objectAtIndex:2] objectForKey:@"sites"];
            sitePool = [sitesPool objectAtIndex:indexPath.item];
            cell.contentLabel.text = [sitePool objectForKey:@"siteName"];
        }
        return cell;
    }
    if (indexPath.section == 7) {
        //Footer
        DiscoverFooterCell * cell = (DiscoverFooterCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"footerCell" forIndexPath:indexPath];
        cell.footerImageView.image = [UIImage imageNamed:@"discover_footer"];
        return cell;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGSize size = CGSizeMake(0, 0);
    
    
    if (indexPath.section == 0) {
        //HEADER
        size = CGSizeMake(screenRect.size.width, screenRect.size.width/2.42);
        //NSLog(@"SCREEN WIDTH: %f, HEIGHT:%f",screenRect.size.width,screenRect.size.width/2.42);
       
    }
    if (indexPath.section == 1 || indexPath.section == 3 || indexPath.section == 5) {
        //SUBTITLE
        size = CGSizeMake(screenRect.size.width, 137);
    }
    if (indexPath.section == 2 || indexPath.section == 4 || indexPath.section == 6) {
        //CONTENT
        size = CGSizeMake(186, 73);
    }
    if (indexPath.section == 7) {
       //FOOTER
        size = CGSizeMake(screenRect.size.width, screenRect.size.width/6.57);
    }
    
    return size;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //HEADER
        //size = CGSizeMake(screenRect.size.width, screenRect.size.width/(375/143));
        
    }
    if (indexPath.section == 1 || indexPath.section == 3 || indexPath.section == 5) {
        //SUBTITLE
        //size = CGSizeMake(screenRect.size.width, screenRect.size.width/(375/60));
    }
    if (indexPath.section == 2 || indexPath.section == 4 || indexPath.section == 6) {
        //CONTENT
        //size = CGSizeMake(186, 73);
        if (indexPath.section == 2) {
            sitesPool = [[discoverData objectAtIndex:0] objectForKey:@"sites"];
            sitePool = [sitesPool objectAtIndex:indexPath.item];
            //cell.contentLabel.text = [sitePool objectForKey:@"siteName"];
        }
        if (indexPath.section == 4) {
            sitesPool = [[discoverData objectAtIndex:1] objectForKey:@"sites"];
            sitePool = [sitesPool objectAtIndex:indexPath.item];
            //cell.contentLabel.text = [sitePool objectForKey:@"siteName"];
        }
        if (indexPath.section == 6) {
            sitesPool = [[discoverData objectAtIndex:2] objectForKey:@"sites"];
            sitePool = [sitesPool objectAtIndex:indexPath.item];
            //cell.contentLabel.text = [sitePool objectForKey:@"siteName"];
        }
        [self performSegueWithIdentifier:@"toDiscoverDetail" sender:self];
    }
    if (indexPath.section == 7) {
        //FOOTER
        //size = CGSizeMake(screenRect.size.width, screenRect.size.width/(375/57));
    }
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"toDiscoverDetail"]) {
        DiscoverDetailViewController * ddvc = (DiscoverDetailViewController *)[segue destinationViewController];
        ddvc.strURL = [sitePool objectForKey:@"pageURL"];
    }
}


@end
