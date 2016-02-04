//
//  HelpTVC.m
//  iStatistic
//
//  Created by lee on 16/2/1.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "HelpTVC.h"
#import "HelpTVCell.h"

@interface HelpTVC ()
@property (strong, nonatomic) NSMutableDictionary *offscreenCells;
@end

@implementation HelpTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.offscreenCells = [NSMutableDictionary dictionary];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"帮助";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HelpTVCell" bundle:nil] forCellReuseIdentifier:@"HelpTVCell"];
    
    self.questionArray = [NSArray arrayWithObjects:@"爱上调查是什么？",@"爱上调查是怎么工作的？",@"爱上调查能为答卷者做什么", nil];
    self.answerArray = [NSArray arrayWithObjects:@"爱上调查是一个高效的调查问卷发布平台，用户可以参与由市场研究机构，盈利或非盈利组织甚至个人发起的调查。同时，爱上调查也能被现有市场调研机构用来作为一个高效的数据收集平台。",@"平台提供工具让用户自定义问题并筛选目标用户群进行投放，使得创建调查问卷从未如此简单和有趣。一旦答卷回收完成，发布者会收到详尽的统计分析报告。",@"作为答卷者，你可以充分利用碎片时间来参与各类调查，将经验和观点贡献给需要的人，以此赚取酬金。", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.questionArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HelpTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HelpTVCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.question.text = [self.questionArray objectAtIndex:indexPath.row];
    cell.answer.text = [self.answerArray objectAtIndex:indexPath.row];
    
    // Make sure the constraints have been added to this cell, since it may have just been created from scratch
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HelpTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HelpTVCell"];
    
    // Configure the cell for this indexPath
    cell.question.text = [self.questionArray objectAtIndex:indexPath.row];
    cell.answer.text = [self.answerArray objectAtIndex:indexPath.row];
    
    // Make sure the constraints have been added to this cell, since it may have just been created from scratch
    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    //cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));

    //[cell setNeedsLayout];
    //[cell layoutIfNeeded];
    
    // Get the actual height required for the cell
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    

    height += 1;
    
    return height;
//    
//    if (!self.prototypeCell)
//    {
//        self.prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:@"HelpTVCell"];
//    }
//
//    [cell setNeedsUpdateConstraints];
//    [cell updateConstraintsIfNeeded];
//    [cell setNeedsLayout];
//    [self.prototypeCell layoutIfNeeded];
//    CGSize size = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//    return size.height;
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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

@end
