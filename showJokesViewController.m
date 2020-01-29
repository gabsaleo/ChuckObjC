//
//  showJokesViewController.m
//  ChuckObjC
//
//  Created by Gabriella Messias Aleo on 27/01/20.
//  Copyright © 2020 Gabriella Messias Aleo. All rights reserved.
//

#import "showJokesViewController.h"

@interface showJokesViewController ()
@end

@implementation showJokesViewController
@synthesize selecionado;


- (void)viewDidLoad {
    [super viewDidLoad];
//    selecionado = @"";
    [self showMessageJoke];
}

-(void)showMessageJoke{
    NSString *urlString= [NSString stringWithFormat:@"https://api.chucknorris.io/jokes/random?category=%@", selecionado];
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      
         NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
            options:NSJSONReadingAllowFragments error:nil];
            NSString *value = json[@"value"];
        NSString *categoriesactual= [NSString stringWithFormat:@"Actual categories is: %@", self->selecionado];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.showMessage.text = value;
             self.showCategorieAcctual.text = categoriesactual;
        
        });
    
    }]resume];

}

- (IBAction)changeJoke:(id)sender {
    [self showMessageJoke];
}
@end
