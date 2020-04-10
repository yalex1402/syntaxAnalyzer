
package Model;

import java.io.IOException;
import java.io.StringReader;

public class LexerHelper {
    
    private Lexer lexer;
    
    public LexerHelper(String code){
        lexer = new Lexer(new StringReader(code));
    }
    
    public Tokens getLexeryylex() throws IOException{
        return lexer.yylex();
    }
    
    public String getLexeme(){
        return lexer.lexeme;
    }
}
