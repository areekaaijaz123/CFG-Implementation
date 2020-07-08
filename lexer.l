%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
extern int yyparse() ;

void grammar(char *str);
int i=0 ;

%}

letter [a-zA-Z]+

%%

[ \t]

"\n"        return 0 ;

{letter}    {
             grammar(yytext) ;

             if (i==1){
              printf("%s\n",yytext) ;
              return(NOUN) ;
             }

             if (i==2){
              printf("%s\n",yytext) ;
              return(VERB) ;
             }

             if (i==3){
              printf("%s\n",yytext) ;
              return(ADJECTIVE) ;
             }

             if (i==4){
              printf("%s\n",yytext) ;
              return(PRONOUN) ;
             }

             if (i==5){
              printf("%s\n",yytext) ;
              return(DETERMINER) ;
             }

             if (i==6){
              printf("%s\n",yytext) ;
              return(PREPOSITION) ;
             }

             if (i==7){
              printf("%s\n",yytext) ;
              return(CONJUNCTION) ;
             }

             if (i==8){
              printf("%s\n",yytext) ;
              return(PROPERNOUN) ; 
             }
           }

%%

void grammar(char *str)
{
 char word[10] ;
 FILE *fp ;
 i=0 ;
 fp = fopen("Noun.txt","r") ;
 while ((fscanf(fp,"%s",word)) != EOF)
  if (strcmp(word,str) == 0)
   i = 1 ;
 fclose(fp) ;

 fp = fopen("Verb.txt","r") ;
 while ((fscanf(fp,"%s",word)) != EOF)
  if (strcmp(word,str) == 0)
   i = 2 ;
 fclose(fp) ;

 fp = fopen("Adjective.txt","r") ;
 while ((fscanf(fp,"%s",word)) != EOF)
  if (strcmp(word,str) == 0)
   i = 3 ;
 fclose(fp);

 fp = fopen("Pronoun.txt","r") ;
 while ((fscanf(fp,"%s",word)) != EOF)
  if (strcmp(word,str) == 0)
   i = 4 ;
 fclose(fp);
 
 fp = fopen("Determiner.txt","r") ;
 while ((fscanf(fp,"%s",word)) != EOF)
  if (strcmp(word,str) == 0)
   i = 5 ;
 fclose(fp);

 fp = fopen("Preposition.txt","r") ;
 while ((fscanf(fp,"%s",word)) != EOF)
  if (strcmp(word,str) == 0)
   i = 6 ;
 fclose(fp);

 fp = fopen("Conjunction.txt","r") ;
 while ((fscanf(fp,"%s",word)) != EOF)
  if (strcmp(word,str) == 0)
   i = 7 ;
 fclose(fp);

 
 fp = fopen("Proper Noun.txt","r") ;
 while ((fscanf(fp,"%s",word)) != EOF)
  if (strcmp(word,str) == 0)
   i = 8 ;
 fclose(fp);
}