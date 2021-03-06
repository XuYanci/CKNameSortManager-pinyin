//
//  CKNameSortManager.h
//  CKIndexTableView
//
//  Created by mac on 15/8/27.
//  Copyright (c) 2015年 kaicheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef id (^ DataSourceBlock)(NSInteger index);
typedef NSUInteger (^ DataSourceCountBlock)();
typedef void(^DataSourceSortCompleteBlock)(NSArray * finalDataSource);
typedef NSString* (^ DataSourceKeywordBlock)(id  name);
typedef NSPredicate *(^DataSourceFilterBlock)();

@interface CKNameSortManager : NSObject
@property(nonatomic, strong, readonly) NSArray * finalDataSource;

@property(nonatomic, copy) DataSourceBlock  dataSourceItemBlock;
@property(nonatomic, copy) DataSourceCountBlock  dataSourceCountBlock;
@property(nonatomic, copy) DataSourceKeywordBlock dataSourceKeywordsBlock;

-(instancetype) initWithTableView:(UITableView *) tabelView target:(id<UITableViewDataSource>) target;
/**
 *  begin sort
 *
 *  @param completeBlock sort complete block
 */
-(void) beginSortNameIndex:(DataSourceSortCompleteBlock) completeBlock;

//filter function
/**
 *  begin filter.If property and value condition isn't suitable for you, you can use predication to filter
 *
 *  @param propertyName   filter  model property name
 *  @param value          property value, default action is contain
 *  @param completeBlock  filter complete block
 */
-(void) beginFilterNameIndexWithName:(NSString*) propertyName value:(id) value completeBlock:(DataSourceSortCompleteBlock) completeBlock;
-(void) beginFilterNameIndexWithPredicate:(NSPredicate *)predicate  completeBlock:(DataSourceSortCompleteBlock)completeBlock;
/**
 *  end filter
 *
 *  @param completeBlock end filter complete block
 */
-(void) endFilterNameWithCompleteBlock:(DataSourceSortCompleteBlock) completeBlock;
@end
