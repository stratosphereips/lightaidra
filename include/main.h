#ifndef __MAIN_H_
#define __MAIN_H_

#define true  (0)
#define false (-1)

#define result_file "/var/run/.lightscan"
#define pidfile "/var/run/.lightpid"

#define sizebuf 2048

extern unsigned short counter, total;
extern char *isrv[10];

#endif
