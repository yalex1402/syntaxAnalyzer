package Controller;
import Model.*;
import java.io.IOException;



public class LexerController {
    
    private String _tokens;
    private int _wordLength;
    
    public LexerController(){
        _tokens = "Token\t\t\t Symbol \n";
        _wordLength = 0;
    } 
    
    public String getTokens() {
        return _tokens;
    }

    public void setTokens(String _tokens) {
        this._tokens = _tokens;
    }

    public int getWordLength() {
        return _wordLength;
    }

    public void setWordLength(int _wordLength) {
        this._wordLength = _wordLength;
    }
    
    
    public boolean FindTokens(LexerHelper lexer) throws IOException{
        
        CheckDataController validation = new CheckDataController();
        Tokens tokens = lexer.getLexeryylex();
        String word = lexer.getLexeme();
        if (!validation.IsTokenNull(tokens)){
            _wordLength = word.length();
            _tokens += "<"+tokens+">\t\t\t" + word +"\n";
        }
        return validation.IsTokenNull(tokens);
    }
    
}
