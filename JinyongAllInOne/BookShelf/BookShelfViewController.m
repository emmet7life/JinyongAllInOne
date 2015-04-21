//
//  BookShelfViewController.m
//  JinyongAllInOne
//
//  Created by 李巍 on 15/4/17.
//  Copyright (c) 2015年 李巍. All rights reserved.
//

#import "BookShelfViewController.h"
#import "BookShelfCollectionView.h"
#import "BookShelfCollectionViewCell.h"

#import "BookMasterViewController.h"

@interface BookShelfViewController ()

@property (weak, nonatomic) IBOutlet BookShelfCollectionView *collectionView;

@end

@implementation BookShelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	UINib *cellNib = [UINib nibWithNibName:@"BookShelfCollectionViewCell" bundle:nil];
	[self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"Cell"];
	
	self.books = [[NSMutableArray alloc] initWithCapacity:20];
	
	for (int i = 0; i < 40; i++) {
		NSNumber *number = @(i);
		[self.books addObject:number];
	}
	[self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return [self.books count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	BookShelfCollectionViewCell *cell = (BookShelfCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//	if (indexPath.row % 3 == 0) {
//		cell.backgroundColor = [UIColor redColor];
//	}else if (indexPath.row % 3 == 1) {
//		cell.backgroundColor = [UIColor greenColor];
//	}else if (indexPath.row % 3 == 2) {
//		cell.backgroundColor = [UIColor yellowColor];
//	}
	return cell;
}

//- (id)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
//	NSLog(@"elment kind = %@", elementKind);
//	return nil;
//}
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//	NSLog(@"elment kind = %@", kind);
//	return nil;
//}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    BookMasterViewController *master = [self.storyboard instantiateViewControllerWithIdentifier:@"BookMasterViewController"];
    [self.navigationController pushViewController:master animated:YES];
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//	TFExamPaperHeaderView *reusableView = (TFExamPaperHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
//	if (total) {
//		reusableView.totalLabel.text = [NSString stringWithFormat:@"总分：%@分", total];
//	}
//	if (avgs) {
//		reusableView.avgsLabel.text = [NSString stringWithFormat:@"平均分：%@分", avgs];
//	}
//	
//	return reusableView;
//}

//- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
//    [collectionView.collectionViewLayout invalidateLayout];
//}


@end
