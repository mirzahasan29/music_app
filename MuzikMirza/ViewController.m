//
//  ViewController.m
//  MuzikMirza
//
//  Created by Mirza Rishad Hasan on 7/23/16.
//  Copyright © 2016 Mirza Rishad Hasan. All rights reserved.
//

#import "ViewController.h"
#import "SongTableViewCell.h"
#import "TitleViewController.h"
#import "CoreDataStack.h"
#import "Song.h"
#import "Song+CoreDataProperties.h"

@interface ViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController {
    
    NSDictionary *dict;
    NSArray *songsArray;
    NSDictionary *eachDict;
    NSString *artistName;
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSString *search = [self.songText.text stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    
    
    NSString *theUrl = [NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@",search];
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:theUrl]
                                 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                     [self performSelectorOnMainThread:@selector(displayDictionary:) withObject:data waitUntilDone:YES];
                                 }] resume];
       self.songText.text = nil;
//    NSLog(@"%@",theUrl);
    return YES;
}

-(void) displayDictionary:(NSData *) data{
    
    dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    songsArray = [dict objectForKey:@"results"];
    [self.songTable reloadData];
//    NSLog(@"%@",songsArray );
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return songsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    SongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[SongTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.playButton.tag = indexPath.row;
    //cell.storeButton.tag = indexPath.row;
    
    [cell cellCreator:[songsArray objectAtIndex:indexPath.row]];
    
    //    cell.storeImg.tag= indexPath.row;

    
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"songSegue"]) {
        
        TitleViewController *detail = segue.destinationViewController;
        UIButton *button = (UIButton *)sender;
        
        detail.songDictDetail = [songsArray objectAtIndex:button.tag];
        
     
    }
    
}



@end



