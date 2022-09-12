/*Author: YuşaÇağatay Günaydın, Student_Number:s211210086, Course:Derleyici Tasarımı*/
%{
  #include <stdio.h> /*Kütüphane*/
  #include <stdlib.h> /*Kütüphane*/
  #include "yacc.y.h" /*Yacc dosyası*/
  extern int yyval;
%}

%%

[0-9]+ {
  yylval = atoi(yytext); /*yytext aldığın değeri integer çevirip yyval içinde sakla*/
  return DIGIT; /*DIGIT Token ile eşitle*/
}
[-+*/()] { return yytext[0]; }
"\n" { return EOL; } /*Birden fazla kez işlem yapabilmek için yaptım*/
[ \t\f\v\n] { ; } /* White-Space işletilsin*/

%%

int yywrap(void)
{
  return 1;
}