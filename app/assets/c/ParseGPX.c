#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

enum state {BUFFER, T, R, K, P, TRKPT, TRKPTSPACE, TRKTRASHD, TRKTRASHS, LATLON, LATA, LATT, LATEQ, LATREAD, LONO, LONN, LONEQ, LONREAD,
TAGO, TRKPT2, CLOSELL, TRKPT3, ELEREAD, ELECLOSE, ELEL, ELEE, ELESPACE, PREELE, PRETIME, TIMET, TIMEI, TIMEM, TIMECLOSE, TIMESPACE, TIMEREAD, ELETRASHD, ELETRASHS,
TIMETRASHD, TIMETRASHS};


int main (int argc, char *argv[])
{
    enum state curr = BUFFER;
    char c;
    while ((c=getchar())!=EOF)
    {
        switch(curr)
        {
        case BUFFER:
            if (c=='<')
            {
                curr=TAGO;
            }
            break;
        case TAGO:
            if (c=='t' || c=='T')
            {
                curr=T;
            }
            else
            {
                curr=BUFFER;
            }
            break;
        case T:
            if (c=='r' || c=='R')
            {
                curr=R;
            }
            else
            {
                curr=BUFFER;
            }
            break;
        case R:
            if (c=='k' || c=='K')
            {
                curr=K;
            }
            else
            {
                curr=BUFFER;
            }
            break;
        case K:
            if (c=='p' || c=='P')
            {
                curr=P;
            }
            else
            {
                curr=BUFFER;
            }
            break;
        case P:
            if (c=='t' || c=='T')
            {
                curr=TRKPTSPACE;
            }
            else
            {
                curr=BUFFER;
            }
            break;
        case TRKPTSPACE:
            if (isspace(c))
            {
                curr=TRKPT;
            }
            else
            {
                curr=BUFFER;
            }
            break;
        case TRKPT:
            if (c=='"')
            {
                curr=TRKTRASHD;
            }
            else if (c==39)
            {
                curr=TRKTRASHS;
            }
            else if (c=='l')
            {
                curr=LATLON;
            }
            break;
        case TRKTRASHD:
            if (c=='"')
            {
                curr=TRKPT;
            }
            break;
        case TRKTRASHS:
            if (c==39)
            {
                curr=TRKPT;
            }
            break;
        case LATLON:
            if (c=='a')
            {
                curr=LATA;
            }
            else if (c=='o')
            {
                curr=LONO;
            }
            else
            {
                curr=TRKPT;
            }
            break;
        case LATA:
            if (c=='t')
            {
                curr=LATT;
            }
            else
            {
                curr=TRKPT;
            }
            break;
        case LATT:
            if (c=='=')
            {
                curr=LATEQ;
            }
            else if (!(isspace(c)))
            {
                curr=TRKPT;
            }
            break;
        case LATEQ:
            if (c=='"' || c==39)
            {
                curr=LATREAD;
            }
            break;
        case LATREAD:
            if (c=='"' || c==39)
            {
                printf(",");
                curr=TRKPT;
            }
            else
            {
                printf("%c", c);
            }
            break;
        case LONO:
            if (c=='n')
            {
                curr=LONN;
            }
            else
            {
                curr=TRKPT;
            }
            break;
        case LONN:
            if (c=='=')
            {
                curr=LONEQ;
            }
            else if (!(isspace(c)))
            {
                curr=TRKPT;
            }
            break;
        case LONEQ:
            if (c=='"' || c==39)
            {
                curr=LONREAD;
            }
            break;
        case LONREAD:
            if (c=='"' || c==39)
            {
                printf(",");
                curr=CLOSELL;
            }
            else
            {
                printf("%c", c);
            }
            break;
        case CLOSELL:
            if (c=='>')
            {
                curr=TRKPT2;
            }
            break;
        case TRKPT2:
            if (c=='<')
            {
                curr=PREELE;
            }
            break;
        case PREELE:
            if (c=='e' || c=='E')
            {
                curr=ELEE;
            }
            else
            {
                curr=TRKPT2;
            }
            break;
        case ELEE:
            if (c=='l' || c=='L')
            {
                curr=ELEL;
            }
            else
            {
                curr=TRKPT2;
            }
            break;
        case ELEL:
            if (c=='e' || c=='E')
            {
                curr=ELESPACE;
            }
            else
            {
                curr=TRKPT2;
            }
            break;
        case ELESPACE:
            if (isspace(c))
            {
                curr=ELECLOSE;
            }
            else if (c=='>')
            {
                curr=ELEREAD;
            }
            else
            {
                curr=TRKPT2;
            }
            break;
        case ELECLOSE:
            if (c=='"')
            {
                curr=ELETRASHD;
            }
            else if (c==39)
            {
                curr=ELETRASHS;
            }
            else if (c=='>')
            {
                curr=ELEREAD;
            }
            break;
        case ELETRASHD:
            if (c=='"')
            {
                curr=ELECLOSE;
            }
            break;
        case ELETRASHS:
            if (c==39)
            {
                curr=ELECLOSE;
            }
            break;
        case ELEREAD:
            if (c=='<')
            {
                printf(",");
                curr=TRKPT3;
            }
            else
            {
                printf("%c", c);
            }
            break;
        case TRKPT3:
            if (c=='<')
            {
                curr=PRETIME;
            }
            break;
        case PRETIME:
            if (c=='t' || c=='T')
            {
                curr=TIMET;
            }
            else
            {
                curr=TRKPT3;
            }
            break;
        case TIMET:
            if (c=='i' || c=='I')
            {
                curr=TIMEI;
            }
            else
            {
                curr=TRKPT3;
            }
            break;
        case TIMEI:
            if (c=='m' || c=='M')
            {
                curr=TIMEM;
            }
            else
            {
                curr=TRKPT3;
            }
            break;
        case TIMEM:
            if (c=='e' || c=='E')
            {
                curr=TIMESPACE;
            }
            else
            {
                curr=TRKPT3;
            }
            break;
        case TIMESPACE:
            if (isspace(c))
            {
                curr=TIMECLOSE;
            }
            else if (c=='>')
            {
                curr=TIMEREAD;
            }
            else
            {
                curr=TRKPT3;
            }
            break;
        case TIMECLOSE:
            if (c=='"')
            {
                curr=TIMETRASHD;
            }
            else if (c==39)
            {
                curr=TIMETRASHS;
            }
            else if (c=='>')
            {
                curr=TIMEREAD;
            }
            break;
        case TIMETRASHD:
            if (c=='"')
            {
                curr=TIMECLOSE;
            }
            break;
        case TIMETRASHS:
            if (c==39)
            {
                curr=TIMECLOSE;
            }
            break;
        case TIMEREAD:
            if (c=='<')
            {
                printf("\n");
                curr=BUFFER;
            }
            else if (c==',')
            {
                printf("&comma;");
            }
            else
            {
                printf("%c",c);
            }
            break;
        }
    }
}
