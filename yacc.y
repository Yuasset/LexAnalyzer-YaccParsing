/*Author: YuşaÇağatay Günaydın, Student_Number:s211210086, Course:Derleyici Tasarımı*/
%{
  #include <stdio.h> /*Kütüphane*/
  #include <stdlib.h> /*Kütüphane*/
  int yyerror(char*);
  int yylex();
%}

%start INPUT /*Başlangıç NON-Terminal*/
%token EOL DIGIT /*Lexerden gelenler*/

%left '+' '-' /*İşlem öncelikleri*/
%left '*' '/' /*İşlem öncelikleri*/
%left '(' ')' /*Birleşim ve İşlem önceliği*/

%% /*-----Birinci ve İkinci Kısım Blogu-----*/

INPUT: line INPUT | line /*Başlangıc NON-Terminal*/
line: expression EOL { printf("Sonuç: %d\n", $1); };

expression: DIGIT  { $$ = $1; };
expression: expression '+' expression  { $$ = $1 + $3; }; /*Üç ifade yer alıyorsa sabit terminal sembole(+) göre kural işlet*/
expression: expression '-' expression  { $$ = $1 - $3; }; /*Üç ifade yer alıyorsa sabit terminal sembole(-) göre kural işlet*/
expression: expression '*' expression  { $$ = $1 * $3; }; /*Üç ifade yer alıyorsa sabit terminal sembole(*) göre kural işlet*/
expression: expression '/' expression  { $$ = $1 / $3; }; /*Üç ifade yer alıyorsa sabit terminal sembole(/) göre kural işlet*/
expression: '(' expression ')' { $$ = $2; }; /*Birden fazla ifadeler için*/

%% /*-----İkinci ve Üçüncü Kısım Blogu-----*/

int main(void)
{
  printf ("Öğrenci: Yuşa Çağatay GÜNAYDIN, No: s211210086 \n\n");
  printf ("Lex ve Yacc Analiz Motoruna Hoşgeldiniz \n");
  printf ("işlemler: Çıkartma, Toplama, Çarpma ve Bölme \n");
  printf ("İşlem önceliği dikkate alınır. Örnek: (2+2)*2 = 8 \n\n");
  yyparse();
  return 0;
}

int yyerror(char *s)
{
  fprintf(stderr, "Hata: %s", s);
  return 0;
}