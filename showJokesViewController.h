//
//  showJokesViewController.h
//  ChuckObjC
//
//  Created by Gabriella Messias Aleo on 27/01/20.
//  Copyright © 2020 Gabriella Messias Aleo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface showJokesViewController : UIViewController
@property (strong, nonatomic) NSString *selecionado;

@property (weak, nonatomic) IBOutlet UILabel *showMessage;
@property (weak, nonatomic) IBOutlet UILabel *showCategorieAcctual;

- (IBAction)changeJoke:(id)sender;

@end

NS_ASSUME_NONNULL_END
