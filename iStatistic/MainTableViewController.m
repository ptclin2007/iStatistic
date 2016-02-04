//
//  MainTableViewController.m
//  statistic
//
//  Created by lee on 16/1/10.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "MainTableViewController.h"
#import "MainTableViewCell.h"
#import "MBProgressHUD.h"
#import "NetAccessUtil.h"
#import "JsonUtil.h"
#import "AppTVC.h"
#import "AppDelegate.h"
#import <Foundation/Foundation.h>
#import "StatisticDescriptionVC.h"

@interface MainTableViewController ()
-(void) urlRequestSuccess:(id)data;
-(void) urlRequestFailed;

@end

@implementation MainTableViewController
-(void) urlRequestSuccess:(id)data
{
    
}

-(void) urlRequestFailed
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"MainTableViewCell"];
    
    
    UIBarButtonItem *applicationButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(selectLeftAction:)];

    self.navigationItem.leftBarButtonItem = applicationButton;
    self.navigationItem.title = @"调查列表";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self requestionData];
}

-(void)requestionData{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{//

        [NetAccessUtil JSONDataWithUrl:@"http://www.happyzd.com/json.php" success:^(id response){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            if([response isKindOfClass:[NSDictionary class]])
            {
                NSDictionary *myClassDict = (NSDictionary *)response;
//                for (id key in myClassDict)
//                {
//                    NSLog(@"key: %@ ,value: %@",key,[myClassDict objectForKey:key]);
//                }
                self.statisticList = [JsonUtil parseResponseToStatisticList:myClassDict];
                NSInteger count = [self.statisticList.listArray count];
                
                for(int i = 0; i < count; i++) {
                    Statistic *statistic = [self.statisticList.listArray objectAtIndex:i];
                    NSString *url = [@"http://www.happyzd.com/" stringByAppendingString:statistic.mainImage];
                    [NetAccessUtil sessionDownloadWithUrl:url success:^(NSURL *fileURL){
                        statistic.fileURL = fileURL;
                        statistic.imageDownloaded = YES;
                        int k = 0;
                        for(int j = 0; j < count; j++) {
                            Statistic *statisticCheck = [self.statisticList.listArray objectAtIndex:i];
                            if(statisticCheck.imageDownloaded) {
                                k++;
                            }
                        }
                        if(count == k) {
                            dispatch_async(dispatch_get_main_queue(), ^{
                                [(UITableView *)self.view reloadData];
                            });
                        }
                        
                    }fail:^(){
                        
                    }];
                }
                

                
            }

        } fail:^(){
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }];
    });
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.statisticList.listArray count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([AppDelegate getAppDelegate].statisticDescriptionVC == nil) {
        [AppDelegate getAppDelegate].statisticDescriptionVC = [self.storyboard instantiateViewControllerWithIdentifier:@"statisticDescription"];
    }
    
    [AppDelegate getAppDelegate].statisticDescriptionVC.statistic = [self.statisticList.listArray objectAtIndex:indexPath.row];
    
    UIViewController *tmpCtrl = [AppDelegate getAppDelegate].statisticDescriptionVC;
    UINavigationController  *naviCtrl = (UINavigationController *)[AppDelegate getAppDelegate].deckController.centerController;
    tmpCtrl.navigationItem.leftBarButtonItem = [naviCtrl.viewControllers lastObject].navigationItem.leftBarButtonItem;
    tmpCtrl.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_btn.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:[AppDelegate getAppDelegate] action:@selector(selectRightAction:)];
    if([naviCtrl.viewControllers containsObject:tmpCtrl]) {
        [naviCtrl popToViewController:tmpCtrl animated:YES];
    } else {
        [naviCtrl pushViewController:tmpCtrl animated:YES];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.parentTableView = self;
    Statistic *aStatistic = [self.statisticList.listArray objectAtIndex:indexPath.row];
    cell.title.text = aStatistic.name;
    
    NSData *dateImg = [NSData dataWithContentsOfURL:aStatistic.fileURL];
    cell.image.image = [UIImage imageWithData:dateImg];
	
    
//    CGSize boundSize = CGSizeMake(216, CGFLOAT_MAX);
//
    //CGSize requiredSize = [cell.title.text sizeWithAttributes: @{NSFontAttributeName: [UIFont systemFontOfSize:24]}];
    
//    CGSize requiredSize = [cell.title.text sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:boundSize lineBreakMode:UILineBreakModeWordWrap];
//
//    CGRect rect = cell.frame;
//    rect.size.height = requiredSize.height+20;
//    if(rect.size.height < 64) {
//        rect.size.height = 64;
//    }
//    cell.frame = rect;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //MainTableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    //return cell.frame.size.height;
    return 64;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



-(void)selectLeftAction:(id)sender
{
    IIViewDeckController *parent = (IIViewDeckController *)[[[UIApplication sharedApplication] delegate] window].rootViewController;
    [parent toggleLeftViewAnimated:YES];
}





@end
