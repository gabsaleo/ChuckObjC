//
//  ListaCategoriasTableViewController.m
//  ChuckObjC
//
//  Created by Gabriella Messias Aleo on 22/01/20.
//  Copyright © 2020 Gabriella Messias Aleo. All rights reserved.
//

#import "ListaCategoriasTableViewController.h"
#import "showJokesViewController.h"


@interface ListaCategoriasTableViewController ()

@property (strong, nonatomic) NSArray *categories;
@property (strong, nonatomic) NSString *selecionado;

-(void)showCategories;

@end

@implementation ListaCategoriasTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showCategories];
    _selecionado=@"";
   
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuse" forIndexPath:indexPath];
    cell.textLabel.text = self.categories[indexPath.row];
    
    
    return cell;
}

-(void)showCategories{
    
    NSString *urlString = @"https://api.chucknorris.io/jokes/categories";
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      
        NSError *err;
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        self.categories = json;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    
    }]resume];

}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"verPiada"]){
        showJokesViewController *vc = (showJokesViewController *) [segue destinationViewController];
        vc.selecionado = sender;
        NSLog(@"%@",vc.selecionado);
    
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *categoria = self.categories[indexPath.row];
    _selecionado = categoria;
    [self performSegueWithIdentifier:@"verPiada" sender:categoria];
}


@end
