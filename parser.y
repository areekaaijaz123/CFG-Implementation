%{ 
#include <stdio.h>
#include <string.h>
extern int yylex() ;
extern int yyparse() ;
extern void yyerror(char *s) ;
%}

%start S

%token NOUN VERB ADJECTIVE PRONOUN PROPERNOUN DETERMINER PREPOSITION CONJUNCTION

%%

S       :    NP VP                       { printf("S\nNP VP\n"); } 
                                         ;

NP      :    PRONOUN                     { 
                                           printf("Pronoun VP\n"); 
                                         } 
        |    PROPERNOUN                  { 
                                           printf("Proper-noun VP\n"); 
                                         }
        |    DETERMINER nominal          { 
                                           printf("Determiner Nominal VP\n"); 
                                         } 
                                         ;

nominal :    NOUN nominal                { 
                                           printf("Noun Nominal VP\n");
                                         }
        |    NOUN                        { 
                                           printf("Noun VP\n"); 
                                         } 
                                         ;

VP      :    VERB                        { 
                                           printf("Verb\n"); 
                                         }
        |    VERB NP                     { 
                                           printf("Verb NP\n"); 
                                         }
        |    VERB NP PP                  { 
                                           printf("Verb NP PP\n"); 
                                         }
        |    VERB PP                     { 
                                           printf("Verb PP\n");
                                         } 
                                         ;

PP      :    PREPOSITION NP              { 
                                           printf("Preposition NP\n"); 
                                         } 
                                         ;

%%

main()
{
 printf("\nEnter a sentence : \n") ;
 yyparse() ;
 return 0;
}

void yyerror(char *s) 
{
 fprintf(stderr, "%s\n",s) ;
}

yywrap()
{
 return 1 ;
}