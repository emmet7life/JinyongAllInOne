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

@interface BookShelfViewController ()

@property (weak, nonatomic) IBOutlet BookShelfCollectionView *collectionView;

@end

@implementation BookShelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	UINib *cellNib = [UINib nibWithNibName:@"BookShelfCollectionViewCell" bundle:nil];
	[self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"Cell"];
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.collectionView.collectionViewLayout invalidateLayout];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 50;
//	return [self.books count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	BookShelfCollectionViewCell *cell = (BookShelfCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
//	NSString *imgName = @"";
//	switch (indexPath.item % 3) {
//		case 0:
//			imgName = @"BookShelfCellLeft";
//			break;
//		case 1:
//			imgName = @"BookShelfCellMiddle";
//			break;
//		case 2:
//			imgName = @"BookShelfCellRight";
//			break;
//		default:
//			break;
//	}
//	cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
//    [cell layoutIfNeeded];
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
//	TFExamPaperDetailViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"TFExamPaperDetailViewController"];
//	detail.paperId = self.papers[indexPath.row][@"id"];
//	detail.navigationItem.title = self.papers[indexPath.row][@"title"];
//	[self.navigationController pushViewController:detail animated:YES];
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
