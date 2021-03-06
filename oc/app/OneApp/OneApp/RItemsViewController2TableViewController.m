//
//  RItemsViewController2TableViewController.m
//  OneApp
//
//  Created by lijunjie on 30/08/2018.
//  Copyright © 2018 lijunjie. All rights reserved.
//

#import "RItemsViewController2TableViewController.h"
#import "RDetailViewController.h"
#import "RItemStore.h"
#import "RItem.h"
#import "RItemCellTableViewCell.h"



@interface RItemsViewController2TableViewController ()<UITableViewDataSource>
@property (nonatomic,strong) IBOutlet UIView *headerView;


@end

@implementation RItemsViewController2TableViewController

- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i=0; i<10; i++) {
            [[RItemStore sharedStore] createItem];
        }
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"HomePower";
    }
    NSUInteger count = [[[RItemStore sharedStore] allItems] count];
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}


-(IBAction)addNewItem:(id)sender {
    [[RItemStore sharedStore] createItem];

    NSInteger lastRow = [self.tableView numberOfRowsInSection:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath]  withRowAnimation:UITableViewRowAnimationTop];
}

-(IBAction)toggleEditingMode:(id)sender {
    if(self.isEditing) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
        
    }
    else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}

- (UIView *) headerView {
    if(!_headerView) {
        [[NSBundle mainBundle ] loadNibNamed:@"RtemsViewController" owner:self options:nil];
    }
    
    return _headerView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];

    UINib *nib = [ UINib nibWithNibName:@"RItemCellTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"RItemCellTableViewCell"];
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return [[[RItemStore sharedStore] allItems] count];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    NSUInteger count =[[[RItemStore sharedStore] allItems] count];
    return count;
//    return 3;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

//    RDetailViewController *detail = [[ RDetailViewController alloc ] init];
    RDetailViewController *detail = [[ RDetailViewController alloc ] initForNewItem:YES];
    
    RItem *selectItem = [[RItemStore sharedStore] allItems][indexPath.row];
    detail.item =selectItem;
//    [self.navigationController pushViewController:detail animated:YES];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:detail];
//    self.navigationController = navController;
//    [self.navigationController ]
//    [self navigationController:navController];
//    [self.navigationController presentedViewController:navController];
    navController.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:navController animated:YES completion:nil];
}
- (void) tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    [[RItemStore sharedStore] moveItemAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items = [[RItemStore sharedStore ] allItems];
        RItem *item = items[indexPath.row];
        
        [ [RItemStore sharedStore] removeItem:item];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建 UITableViewCell 对象，风格使用默认的 UITableViewCellStyleDefault
    //    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
//    // 创建或重用 UITableViewCell 对象
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
//
//    // 获取 allItems 的第 n 个 BNRItem 对象，
//    // 然后将该 BNRItem 对象的描述信息赋给 UITableViewCell 对象的 textLabel
//    // 这里的 n 是该 UITableViewCell 对象所对应的表格行索引
//    NSArray *items = [[RItemStore sharedStore] allItems];
//    RItem *item = items[indexPath.row]; //0-9
//
//    NSLog(@"indexPath.row == %lu", indexPath.row);
//
//    cell.textLabel.text = [item description];
//    cell.textLabel.text = @"test";
    
    
    RItemCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RItemCellTableViewCell" forIndexPath:indexPath];
    NSArray *items = [[ RItemStore sharedStore] allItems];
    RItem *item = items[indexPath.row];
//    cell.textLabel.text = item.description;
    cell.nameLabel.text = item._itemName;
    cell.serialNumberLabel.text = item._serialNumber;
    cell.valueLabel.text = [ NSString stringWithFormat:@"$%d",item._valueInDollars];
    
    return cell;
}


-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
