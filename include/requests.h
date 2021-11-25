#ifndef __REQUESTS_H_
#define __REQUESTS_H_

extern int login_status, stop;
extern int random_ct, random_num;
extern char *token;

int cmd_ping(sock_t *);

#endif
