#include "dep.h"

#define CONCAT(__STR1, __STR2) (__STR1)##(__STR2_)
#define FUN(__MSG) CONCAT(USE, ", which might doesn't make any sense!")