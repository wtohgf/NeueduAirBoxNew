//
//  NEUABDevMngTableViewController.m
//  NeueduAirBox
//
//  Created by neuedu on 15/11/16.
//  Copyright (c) 2015年 hegf. All rights reserved.
//

#import "NEUABDevMngTableViewController.h"
#import "NEUABEquipmentManageModel.h"
#import "NEUABDevMngTableViewCell.h"
#import "NEUABNetworkMngTool.h"
#import "NEUABRegDeviceModel.h"

@interface NEUABDevMngTableViewController ()
@property (strong,nonatomic) NSMutableArray * DevMnglist;
@end

@implementation NEUABDevMngTableViewController


-(NSMutableArray *)DevMnglist{

    if (_DevMnglist==nil) {
        _DevMnglist=[NSMutableArray array];
        NSArray*DevMnglist=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Property List.plist" ofType:nil]];
        for (int i=0; i<DevMnglist.count; i++) {
            NEUABEquipmentManageModel*model=[NEUABEquipmentManageModel equipmentManageWithDictionary:DevMnglist[i]];
            [_DevMnglist addObject:model];
            
        }
    }
    return _DevMnglist;
    
}
-(void)viewWillAppear:(BOOL)animated{

    
    
    //测试根据每个用户取的设备列表  test1 （正常状态）----------------------------
    [[NEUABNetworkMngTool sharedNetworkMngTool]GetequipNoAccount:@"13622223333"];
    //测试如若用户没有天加任何数据 请回到注册界面注册新的号码并进行测试----------------
    [[NEUABNetworkMngTool sharedNetworkMngTool]GetequipNoAccount:@"13622221111"];
    //13622221111为申请但并未进行添加任何设备
    
    //假若用户没有进行登录 则以上函数走不到
    


}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backPage:)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"添加关联" style:UIBarButtonItemStylePlain target:self action:@selector(addEquipmentManage)];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)addEquipmentManage{

    [self performSegueWithIdentifier:@"toadddev" sender:nil];
    


}
-(void)backPage:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.DevMnglist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NEUABDevMngTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"neuabdecell" forIndexPath:indexPath];
    
    NEUABEquipmentManageModel*model=_DevMnglist[indexPath.row];
    cell.model=model;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NEUABEquipmentManageModel*model=self.DevMnglist[indexPath.row];
    _DevMnglist=nil;
    
    
    //测试删除已添加的设备   test1  正常状态
    [[NEUABNetworkMngTool sharedNetworkMngTool]LogoutequipmentAccount:@"13622223333" Equipment:@"KQHZ000001"];
    
    //测试删除已添加的设备   test2  异常状态
    [[NEUABNetworkMngTool sharedNetworkMngTool]LogoutequipmentAccount:@"33622223333" Equipment:@"KQHZ000001"];

    //测试删除已添加的设备   test3  异常状态
    [[NEUABNetworkMngTool sharedNetworkMngTool]LogoutequipmentAccount:@"1362222222223333" Equipment:@"KQHZ000001"];
    
    //测试删除已添加的设备   test4  异常状态
    [[NEUABNetworkMngTool sharedNetworkMngTool]LogoutequipmentAccount:@"13622" Equipment:@"KQHZ000001"];
    //测试删除已添加的设备   test5  异常状态
    [[NEUABNetworkMngTool sharedNetworkMngTool]LogoutequipmentAccount:@"13622223333" Equipment:@"KQHZ001"];
    //测试删除已添加的设备   test6  异常状态

    [[NEUABNetworkMngTool sharedNetworkMngTool]LogoutequipmentAccount:@"13622223333" Equipment:@"KQHZ00000000001"];
    [self.tableView reloadData];
    
    //测试删除已添加的设备   test7  正常状态
    [[NEUABNetworkMngTool sharedNetworkMngTool]LogoutequipmentAccount:@"13622223333" Equipment:@"HQHZ000001"];

    
    
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

@end
