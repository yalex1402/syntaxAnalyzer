
package Model;

import java.io.StringReader;
import java_cup.runtime.Symbol;

public class SintaxHelper {
    
    private boolean _result;
    
    public SintaxHelper(){
        _result = false;
    }

    public boolean getResult() {
        return _result;
    }

    public void setResult(boolean _result) {
        this._result = _result;
    }
    
    
    
    public String getAnalisis(String code){
        
        Sintax s = new Sintax(new LexerCup(new StringReader(code)));
        String text;
        try {
            s.parse();
            text = "Analisis realizado correctamente";
            _result = true;
        } catch (Exception ex) {
            Symbol sym = s.getS();
            text = "Error de sintaxis. Linea: " + (sym.right + 1) + " Columna: " + (sym.left + 1) + ", Texto: \"" + sym.value + "\"";
        }
        return text;
    }
    
}
