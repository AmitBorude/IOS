//
//  ViewController.m
//  IOSFirst
//
//  Created by Vishal Chothani on 10/22/14.
//  Copyright (c) 2014 277. All rights reserved.
//

#import "ViewController.h"
#import "AddViewController.h"

@interface ViewController ()<NSURLSessionDelegate>

@end

@implementation ViewController
@synthesize storageData;

- (void)viewDidLoad
{
    [super viewDidLoad];
	//
    storageData = [[NSMutableArray alloc]initWithObjects: nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger) numberOfSectionsInTableView:(UITableView *) tableView
{
    return 1;
}

- (NSInteger) tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [storageData count];
}

- (UITableViewCell *)tableView: (UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [storageData objectAtIndex:indexPath.row];
    return cell;
}

// Call after save is pressed

- (IBAction)unWindToTableViewController:(UIStoryboardSegue *)sender
{
    AddViewController *addViewController = (AddViewController *) sender.sourceViewController;
    NSString *locationText = addViewController.locationTextField.text;
    NSString *callReasonText = addViewController.callReasonTexttField.text;
    NSString *descriptionText = addViewController.descriptionTextField.text;
    
//    NSLocale *currentLocale = [NSLocale currentLocale];
//    [[NSDate date] descriptionWithLocale:currentLocale];
    
    NSDate *currentDate = [[NSDate alloc] init];
    // or specifc Timezone: with name
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *localDateString = [dateFormatter stringFromDate:currentDate];
    
//    locationText = [NSString stringWithFormat:@"%@ %@", locationText, localDateString];
    
    // If not blank and not white space
    if(![locationText length]==0 && ![[locationText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0)
    {
        // Add to top
        [storageData insertObject:locationText atIndex: 0];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        
        // Insert it to view table
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation: UITableViewRowAnimationAutomatic];
        [self.tableView endUpdates];
        
        NSURL *url = [NSURL fileURLWithPath: @"/Users/vishalchothani/Desktop/ios.txt"];
        
        NSString *fileContent = [NSString stringWithContentsOfURL:url encoding: NSUTF8StringEncoding error:nil];
        NSLog(@"fileContent = %@", fileContent);
        
//        NSString *newFileContent = [NSString stringWithFormat:locationText];
//        [newFileContent writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil];
        [self sendHTTPPostWithParameterString:[NSString stringWithFormat:@"location=%@&callReason=%@&desc=%@&date=%@",locationText, callReasonText, descriptionText, localDateString]];
        
    }
}

-(void) sendHTTPPostWithParameterString:(NSString *)parameters
{
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:@"https://posttestserver.com/post.php"];
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:url];
    //your data here

    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setHTTPBody:[parameters dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithRequest:urlRequest];
    [dataTask resume];
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler
{
    NSLog(@"### handler 1");
    
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data
{
    NSString * str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Received String %@",str);
}
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
didCompleteWithError:(NSError *)error
{
    if(error == nil)
    {
        NSLog(@"Download is Succesfull");
    }
    else
        NSLog(@"Error %@",[error userInfo]);
}

@end
