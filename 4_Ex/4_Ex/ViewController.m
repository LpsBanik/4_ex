//
//  ViewController.m
//  4_Ex
//
//  Created by AcerHack on 28.03.18.
//  Copyright © 2018 AcerHack. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray <NSString*> *section;

@property (nonatomic, strong) NSArray <NSString*> *strings;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.section = @[@"Navigation actions", @"Log actions"];
//    self.strings = @[@[@"Back", @"Push", @"Present modal"], @[@"Log section number", @"Log row number", @"Log table frame", @"Log cell frame"]];
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseID"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Navigation actions"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Log actions"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return @"Navigation actions";
    if (section == 1) {
        return @"Log actions";
    }
    return @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {

        return 3;
    }
    if (section == 1) {

        return 4;
   }
 
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"reuseID" forIndexPath:indexPath];
//    cell.textLabel.text = self.strings[indexPath.row];

    UITableViewCell *cell;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Navigation actions" forIndexPath:indexPath];
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"Back";
                break;
            case 1:
                cell.textLabel.text = @"Push";
                break;
            case 2:
                cell.textLabel.text = @"Present modal";
                break;
            default:
                break;
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Log actions" forIndexPath:indexPath];
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"Log section number";
                break;
            case 1:
                cell.textLabel.text = @"Log row number";
                break;
            case 2:
                cell.textLabel.text = @"Log table frame";
                break;
            case 3:
                cell.textLabel.text = @"Log cell frame";
                break;
            default:
                break;
        }
        cell.accessoryType = UITableViewCellAccessoryDetailButton;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"Row Selected = %li",indexPath.row);
    
    
}

@end
