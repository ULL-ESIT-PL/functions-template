%{
const reservedWords = ["print","fun", "true", "false", "i"]  

const idOrReserved = text => {
                 //console.log(reservedWords);
                 if (reservedWords.find(w => w == text)) return text.toUpperCase();
                 return 'ID';
               }
%}
number [0-9]+(\.[0-9]+)?([eE][+-]?[0-9]+)?"i"?|"i"

%%
\s+            /* skip whites */;
"#".*          /* skip comments */;
{number}       return 'N';
[a-zA-Z_]\w*   return idOrReserved(yytext); // must be after number
'**'           return '**';
'=='           return '==';
'&&'           return '&&';
'||'           return '||';
[-=+*/!(),@&{}\[\]]  return yytext;
