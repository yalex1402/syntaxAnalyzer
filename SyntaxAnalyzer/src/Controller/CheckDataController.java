package Controller;
import Model.Tokens;

public class CheckDataController {
    
    public boolean IsEmpty (String code){
        return code.isEmpty() || code.isBlank();
    }
    
    public boolean IsTokenNull(Tokens token){
        return token == null;
    }
    
}
