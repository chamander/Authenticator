//
//  HOTPGenerator.m
//
//  Copyright 2013 Matt Rubin
//  Copyright 2011 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License"); you may not
//  use this file except in compliance with the License.  You may obtain a copy
//  of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
//  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
//  License for the specific language governing permissions and limitations under
//  the License.
//

#import "HOTPGenerator.h"


@implementation HOTPGenerator
@synthesize counter = counter_;

+ (uint64_t)defaultInitialCounter {
  return 1;
}

- (id)initWithToken:(OTPToken *)token
             counter:(uint64_t)counter {
  if ((self = [super initWithToken:token])) {
    counter_ = counter;
  }
  return self;
}

- (NSString *)generateOTP {
  uint64_t counter = [self counter];
  counter += 1;
  NSString *otp = [super generateOTPForCounter:counter];
  [self setCounter:counter];
  return otp;
}

@end
