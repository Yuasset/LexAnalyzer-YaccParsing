# LexAnalyzer-YaccParsing
Lex Tarayıcısı ve Yacc Ayrıştırıcı Kullanılarak dört işlem yapan ve işlem önceliğinde LR ayrıştırması kullanan basit bir derleyici tasarladım 

*Lexical Analiz ödevinde "Cygwin64 Terminal" kullanılmıştır.
*Her iki dosya aynı dizinde bulunmalıdır.
*Yapılan test Output.png dosyasında görsel olarak dosya içinde sunulmuştur.

Grammer Oluşturma Mantığı/Yönetemi;
Lex Dosyasında Kabul Edilecek Karakterler:
0'dan 9'a kadar pozitif kapanmayı integer formatında dönüştürüp DIGIT tokenı ile eşle. [0-9]+
Grammer kurallarında gerçerli olacak terminal sembolleri yani mantıksal operatörlerden "-,+,*,/,( ve )" karakterleri girdi olarak kabul et. [-+*/()] { return yytext[0]; }
Her işlem için tekrar exeyi açmayı önlemek için string ifade olarak verilen '\n' end-of-line ifadesini EOL Tokeni ile eşle. "\n" { return EOL; }
white-space yerine geçen tüm boşlukları ";" şeklinde işlet. [ \t\f\v\n] { ; }
Yacc Token ve Grammer Kuralları:
Başlangıç olarak INPUT adlı non-terminal tanımla. %start INPUT
EOL ve DIGIT Tokenleri tanımla. %token EOL DIGIT
İşlem önceliklerini belirle. %left '+' '-'
İşlem önceliklerini belirle. %left '*' '/'
Hem işlem önceliği hem de birleşme özelliğini belirle. %left '(' ')'
Grammerler:
S     ->    line INPUT
       |    line
line  -> <exp> EOL
exp   -> DIGIT
       | exp + exp
       | exp - exp
       | exp * exp
       | exp / exp
       | ( exp )

Farklı herhangi girdi kullanımında syntax error ile karşılaşacaktır.      

Hazırlamış olduğum Lexical tarayıcısını çalıştırmak için aşağıdaki adımlar uygulanmalıdır.
Dosyaların bulunduğu dizin belirtilir:
    cd /Lexical/
Lex dosyasını C dosyasına dönüştür:
    flex -o lex.l.c lex.l
Yacc dosyasını C dosyasına dönüştür:
    bison -o yacc.y.c -d yacc.y
Derle:
    gcc -o hesap lex.l.c yacc.y.c
Derlenen exeyi execute yap:
    ./hesap
    
İlgili Lexical Scanner ve Yacc Analyzer 4 işlem olarak çıkartma, toplama, çarpma ve bölme işlemlerini gerçekleştirir.

Lex dosyası isimi:
lex.l

Yacc dosyası isimi:
yacc.y

Şeklinde hazırlanmıştır ve dosyalar herhangi bir metin editörü aracılığıyla açılabilir incelenebilir.
Lex dosyasında sözdizimi olarak alınabilecek kurallar tanımlanıp yacc.y dosyasıyla eşitlenmektedir.
Yacc dosyasında ise eşitlenen ifadelerin kurallara göre ayrıştırılarak ilgili kural ile işletilmesi sağlanılmıştır.
