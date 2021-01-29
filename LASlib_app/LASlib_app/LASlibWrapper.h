//
//  LASlibWrapper.h
//  LASlib_app
//
//  Created by Kenneth Schröder on 29.01.21.
//

#ifndef LASlibWrapper_h
#define LASlibWrapper_h

#import <Foundation/Foundation.h>

// This is a wrapper Objective-C++ class around the C++ class
@interface LASwriter_oc : NSObject

-(void)write_cloud:(char*)name;

@end

#endif /* LASlibWrapper_h */
