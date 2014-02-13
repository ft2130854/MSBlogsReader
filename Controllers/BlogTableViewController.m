//
//  BlogTableViewController.m
//  MSBLogs_AllanXing
//
//  Created by AgnesT on 14-1-27.
//  Copyright (c) 2014年 allan. All rights reserved.
//

#import "BlogTableViewController.h"
#import "NSURLConnectionExercise.h"
#import "GDataXMLNode.h"
#import "Channel.h"

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
    
    _channel=[Channel new];

    NSURLConnectionExercise *ex=[[NSURLConnectionExercise alloc] initWithUrl:[[NSURL alloc] initWithString:@"http://sxp.microsoft.com/feeds/3.0/devblogs"]delegate:self];

//    [ex StartConnection];
    
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"testFeed" ofType:@"xml"];
    [self HttpStringCallBack:[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL]];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
       static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - NSURLConnection delegate

-(void) HttpStringCallBack:(NSString *)string{
    NSError *error;
    GDataXMLDocument *doc=[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:&error];
    NSArray *array=[[doc rootElement] elementsForName:[Channel Name]];
    GDataXMLElement * element= (GDataXMLElement *) array[0];
    
    _channel.Title = [[element elementsForName:[Channel TitleElementName]][0] stringValue];
    _channel.description=[[element elementsForName:[Channel DescriptionElementName]][0] stringValue];
    _channel.CopyRight=[[element elementsForName:[Channel CopyRightElementName]][0] stringValue];
    _channel.Link=[[element elementsForName:[Channel LinkElementName]][0] stringValue];
    _channel.Generator=[[element elementsForName:[Channel GeneratorElementName]][0]stringValue];
    _channel.Items=[[NSMutableArray alloc]initWithArray:[element elementsForName:[Channel ItemsElementName]]];
    
    //    AllanXmlParse *parse=[[AllanXmlParse alloc] initWithString:string];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
