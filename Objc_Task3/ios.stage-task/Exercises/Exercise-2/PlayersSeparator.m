#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    int output = 0;
        BOOL iBiggerJ, iLessJ, jBiggerK, jLessK, sort, sortReverse;
        for (int i = 0; i < ratingArray.count; ++i) {
            for (int j = i + 1; j < ratingArray.count; ++j) {
                for (int k = j + 1; k < ratingArray.count; ++k) {
                    jLessK = [ratingArray[j] intValue] < [ratingArray[k] intValue];
                    iLessJ = [ratingArray[i] intValue] < [ratingArray[j] intValue];
                    jBiggerK = [ratingArray[j] intValue] > [ratingArray[k] intValue];
                    iBiggerJ = [ratingArray[i] intValue] > [ratingArray[j] intValue];
                    sort = iLessJ && jLessK;
                    sortReverse = iBiggerJ && jBiggerK;
                    if (sort || sortReverse){
                        output++;
                    }
                }
            }
        }
        return output;
}

@end
