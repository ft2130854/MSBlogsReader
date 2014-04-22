//
//  BlogTableViewController.m
//  MSBLogs_AllanXing
//
//  Created by AgnesT on 14-1-27.
//  Copyright (c) 2014年 allan. All rights reserved.
//
#define isUseTextModel
#import "BlogTableViewController.h"
#import "NSURLConnectionExercise.h"
#import "GDataXMLNode.h"
#import "Channel.h"
#import "DetailViewController.h"
#import "WebViewPhoneCache.h"
#import "MBProgressHUD.h"
#import "NSDateUtilities.h"
#import "LocalStoreHelper.h"
#import "Entity.h"
#import "Constant.h"
#import "CommonLib.h"

@interface BlogTableViewController ()

@end

@implementation BlogTableViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    LocalStoreHelper * ls=[LocalStoreHelper new];
    //    [ls somemethod:@"d"];
    //    NSArray *array=   [ls fetchSomeDataForModel:@"Entity"];
    //    Entity * entity=array[0];
    //    NSLog(@"%@",entity.articleList);
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    refreshControl.tintColor =[UIColor magentaColor];
    refreshControl.attributedTitle=[[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    
    self.refreshControl = refreshControl;
    [refreshControl addTarget:self action:@selector(PullToRefresh) forControlEvents:UIControlEventValueChanged];
    
    _channel=[Channel new];
    _httpTempChannel=[Channel new];
    [self  showProgressbar];
#ifdef  isUseTextModel
    //true  feed
    NSString* path = [[NSBundle mainBundle] pathForResource:localCachFile ofType:@"xml"];
    [self HttpStringCallBack:[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL]];
    
    [self  showProgressbar];
    NSURLConnectionExercise *ex=[[NSURLConnectionExercise alloc] initWithUrl:[[NSURL alloc] initWithString:feedUrl]delegate:self];
    [ex StartConnection];
#else
    //local test feed
    NSString* path = [[NSBundle mainBundle] pathForResource:localCachFile ofType:@"xml"];
    [self HttpStringCallBack:[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL]];
#endif
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)SetRefreshDateTime:(NSDate *)value{
    NSUserDefaults * userDefault=[NSUserDefaults standardUserDefaults];
    [userDefault setObject:value forKey:RefreshTime];
}

-(NSDate *)GetRefreshDateTime{
    NSUserDefaults * userDefault=[NSUserDefaults standardUserDefaults];
    NSDate *date=(NSDate *)[userDefault objectForKey:RefreshTime];;
  //  if([userDefault objectIsForcedForKey:RefreshTime]){
    if (!date){
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *currentDate = [NSDate date];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:-18];
        NSDate *minDate = [gregorian dateByAddingComponents:comps toDate:currentDate  options:0];
        date=minDate;
    }
    return date;
}

-(void)showProgressbar{
    ProgressBar=[MBProgressHUD showHUDAddedTo:self.parentViewController.view animated:YES];
    ProgressBar.labelText=@"Loading...";
    
}
- (void)PullToRefresh
{
    NSURLConnectionExercise *ex=[[NSURLConnectionExercise alloc] initWithUrl:[[NSURL alloc] initWithString:feedUrl]delegate:self];
    [ex StartConnection];
    
   
    
    //[self performSelector:@selector(updateTable) withObject:nil afterDelay:4];
}

- (void)updateTable
{
    
    [self.tableView reloadData];
    
    [self.refreshControl endRefreshing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)tableViewItemSelector:(id)sender{
    
}

-(IBAction)ClearCacheAction:(id)sender{
    [WebViewPhoneCache ClearCache];
}
#pragma mark- tableView delegate


-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    UIStoryboard *sb= [UIStoryboard storyboardWithName:@"Main" bundle:Nil];
    //    DetailViewController *controller=  [sb instantiateViewControllerWithIdentifier:@"DetailViewController"];
    //    [[self navigationController] pushViewController:controller animated:YES];
    _index=indexPath.item;
    
    return indexPath;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSError *error;
        NSString* path = [[NSBundle mainBundle] pathForResource:localCachFile ofType:@"xml"];
        NSString *s=     [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
        GDataXMLDocument *doc=[[GDataXMLDocument alloc] initWithXMLString:s options:0 error:&error];
        NSArray *array=[[doc rootElement] elementsForName:[Channel Name]];
        GDataXMLElement * element= (GDataXMLElement *) array[0];
        
        //  [element removeChild: [element childAtIndex:indexPath.row]];
        
        GDataXMLNode * gmlnode= [element elementsForName:[Channel ItemsElementName]][indexPath.row];
        [element removeChild:gmlnode];
        NSData *willSaveString=[doc XMLData];
        
        [willSaveString writeToFile:path atomically:YES];
        [_channel.Items removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}



-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  UITableViewCellEditingStyleDelete;
}
#pragma mark - Table view data source



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"pushToDetail"]) {
        id detailController=segue.destinationViewController;
        [detailController setValue:_channel.Items[_index] forKey:@"ArticleItem"];
    }
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
////#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_channel.Items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell textLabel].text=[_channel.Items[indexPath.row] Title];
    // Configure the cell...
    
    return cell;
}

#pragma mark - NSURLConnection delegate

-(void) HttpStringCallBack:(NSString *)string{
    if (!string||[string isEqual:@""]) {
        [ProgressBar hide:YES];
        [self.refreshControl endRefreshing];
        return;
    }
    NSError *error;
    GDataXMLDocument *doc=[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:&error];
    NSArray *array=[[doc rootElement] elementsForName:[Channel Name]];
    GDataXMLElement * element= (GDataXMLElement *) array[0];
    
    _channel.Title = [[element elementsForName:[Channel TitleElementName]][0] stringValue];
    _channel.description=[[element elementsForName:[Channel DescriptionElementName]][0] stringValue];
    _channel.CopyRight=[[element elementsForName:[Channel CopyRightElementName]][0] stringValue];
    _channel.Link=[[element elementsForName:[Channel LinkElementName]][0] stringValue];
    _channel.Generator=[[element elementsForName:[Channel GeneratorElementName]][0]stringValue];
    if (_channel.Items==nil||_channel.Items.count==0) {
        _channel.Items=[[NSMutableArray alloc]initWithArray:[element elementsForName:[Channel ItemsElementName]]];
    }else{
        NSMutableArray * tempOlder= _channel.Items;
        NSMutableArray * newArray=  [[NSMutableArray alloc]initWithArray:[element elementsForName:[Channel ItemsElementName]]];
        NSDate *leastRefreshDateTime=[self GetRefreshDateTime];
         _channel.Items=newArray;
        NSMutableArray *filterArray=[NSMutableArray new];
        for (Item * it in _channel.Items) {
            if( [[CommonLib DateWithString:it.PubDate] compare:leastRefreshDateTime]==NSOrderedDescending){
                [filterArray addObject:it];
            }
        }
        _channel.Items=filterArray;
        [_channel.Items addObjectsFromArray:tempOlder];
        [_channel.Items sortedArrayUsingComparator: ^(id obj1, id obj2){
            Item * item1,*item2;
            item1=(Item *)obj1;
            item2=(Item *)obj2;
            NSDate * date1=  [CommonLib DateWithString:item1.PubDate];
            NSDate * date2=  [CommonLib DateWithString:item2.PubDate];
            return [date1 compare:date2];
        }];
        Item *articalItem=(Item *)_channel.Items[0];
        [self SetRefreshDateTime:[CommonLib DateWithString:articalItem.PubDate]];
        [self updateTable];
    }
    //    AllanXmlParse *parse=[[AllanXmlParse alloc] initWithString:string];
    [ProgressBar hide:YES];
    
}





/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

@end
