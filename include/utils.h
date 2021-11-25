#ifndef __UTILS_H_
#define __UTILS_H_

#define IPREQUEST "GET /index.html HTTP/1.0\nHost: icanhazip.comn\n"

#ifdef MIPSEL
    #define ipreq   "64.182.208.183"
#elif MIPS
    #define ipreq   "104.238.136.31"
#elif SUPERH
    #define ipreq   "104.238.141.75"
#elif ARM
    #define ipreq   "104.238.141.75"
#elif PPC
    #define ipreq   "104.238.136.31"
#else
    #define ipreq   "104.238.141.75"
#endif

extern char decodedpsw[32];

void pidprocess();
char * getrstr();
void decode(char * str, int);

#endif
