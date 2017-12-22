//
//  EventTabViewController.m
//  一路发
//
//  Created by 姚远 on 12/12/17.
//  Copyright © 2017 OC.yilufa. All rights reserved.
//

#import "EventTabViewController.h"
#import "EventTableViewCell.h"
#import "EventData.h"
#import "EventDetailViewController.h"
@interface EventTabViewController ()

@end

@implementation EventTabViewController{
    CGRect screenRect;
    NSArray * events;
    NSDictionary * event;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    screenRect = [[UIScreen mainScreen] bounds];
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self reloadContentView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 11;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EventTableViewCell * cell =(EventTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"eventCell"];
    cell.eventContentView.image = [UIImage imageNamed:[NSString stringWithFormat:@"event_%ld",(long) indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!events) {
        events = [EventData getEventList];
    }
    //NSLog(@"%@",indexPath.description);
    event = [events objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"toEventDetail" sender:self];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    float height = (screenRect.size.width /5) + 12;
    return height;
}

-(void) reloadContentView{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.contentTable reloadData];
    });
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    EventDetailViewController * edvc = (EventDetailViewController *)[segue destinationViewController];
    edvc.event = event;
}


@end
