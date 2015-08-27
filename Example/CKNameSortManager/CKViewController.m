//
//  CKViewController.m
//  CKNameSortManager
//
//  Created by kaich on 08/27/2015.
//  Copyright (c) 2015 kaich. All rights reserved.
//

#import "CKViewController.h"
#import <CKNameSortManager/CKNameSortManager.h>

@interface CKViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) CKNameSortManager * manager;
@end

@implementation CKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray * nameArray = @[@"白飞",@"andy",@"张冲",@"林峰",@"kylin",@"王磊",@"emily",@"陈标",@"billy",@"韦丽"];
    self.manager = [[CKNameSortManager alloc] initWithTableView:self.tableView target:self];
    self.manager.dataSourceItemBlock = ^(NSInteger index){
        return nameArray[index];
    };
    self.manager.dataSourceCountBlock = ^(){
        return nameArray.count;
    };
    [self.manager beginSortNameIndex:^(NSArray *finalDataSource) {
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.manager.finalDataSource objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text =self.manager.finalDataSource[indexPath.section][indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}
@end
