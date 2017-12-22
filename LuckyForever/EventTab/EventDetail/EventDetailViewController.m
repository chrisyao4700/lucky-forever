//
//  EventDetailViewController.m
//  一路发
//
//  Created by 姚远 on 12/12/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import "EventDetailViewController.h"
#import "EventFooterTableViewCell.h"
#import "EventContentTableViewCell.h"
#import "EventSeperaterTableViewCell.h"

@interface EventDetailViewController ()

@end

@implementation EventDetailViewController{
    CGRect screenRect ;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    screenRect = [[UIScreen mainScreen] bounds];
    //self.contentView.userInteractionEnabled = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [[self.event objectForKey:@"contents"] count] + 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString * temp = @"";
    
    if (section > 1 && (section < [[self.event objectForKey:@"contents"] count] +2)) {
        temp = [[[self.event objectForKey:@"contents"] objectAtIndex:section - 2] objectForKey:@"subTitle"];
    }
    return temp;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //HEADER
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
        cell.textLabel.text = [self.event objectForKey:@"title"];
        cell.userInteractionEnabled = NO;
        return cell;
    }
    if (indexPath.section == 1) {
        EventSeperaterTableViewCell * cell = (EventSeperaterTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"seperateCell"];
        cell.seperateImageView.image = [UIImage imageNamed:@"line"];
        cell.userInteractionEnabled = NO;
        return cell;
    }
    if (indexPath.section > 1 && (indexPath.section < [[self.event objectForKey:@"contents"] count] +2)) {
        //Content
        EventContentTableViewCell * cell = (EventContentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"contentCell"];
        cell.contentTextView.text = [[[self.event objectForKey:@"contents"] objectAtIndex:indexPath.section - 2] objectForKey:@"content"];
        cell.userInteractionEnabled = NO;
        return cell;
    }
    
    
    if (indexPath.section == [[self.event objectForKey:@"contents"] count] + 2) {
        //FOORER
        EventFooterTableViewCell * cell =(EventFooterTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"footerCell"];
        cell.footerImageView.image = [UIImage imageNamed:@"event_footer"];
        cell.userInteractionEnabled = NO;
        return  cell;
    }
    return nil;
}
-(CGFloat)heightForText:(NSString*)text withFont:(UIFont *)font andWidth:(CGFloat)width
{
    CGSize constrainedSize = CGSizeMake(width, MAXFLOAT);
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text attributes:attributesDictionary];
    CGRect requiredHeight = [string boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    if (requiredHeight.size.width > width) {
        requiredHeight = CGRectMake(0,0,width, requiredHeight.size.height);
    }
    if (requiredHeight.size.height < 60) {
        return 60;
    }
    return requiredHeight.size.height;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //HEADER
        return 56.0;
        
    }
    if (indexPath.section == 1) {
        return 21;
    }
    if (indexPath.section > 1 && (indexPath.section < [[self.event objectForKey:@"contents"] count] + 2)) {
        //Content
        
        return [self heightForText:[[[self.event objectForKey:@"contents"] objectAtIndex:indexPath.section - 2] objectForKey:@"content"] withFont:[UIFont systemFontOfSize:18.0] andWidth:screenRect.size.width-40]+25;
        ;
    }
    
    
    if (indexPath.section == [[self.event objectForKey:@"contents"] count] + 2) {
        //FOORER
        return screenRect.size.width/(375.0/70.0);
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    if ([view isKindOfClass:[UITableViewHeaderFooterView class]]) {
        UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView *)view;
        headerView.contentView.backgroundColor = [UIColor clearColor];
        headerView.backgroundView.backgroundColor = [UIColor clearColor];
        [headerView.textLabel setFont:[UIFont systemFontOfSize:18]];
        [headerView.textLabel setTextColor:[UIColor yellowColor]];
    }
}
- (IBAction)didHitBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
