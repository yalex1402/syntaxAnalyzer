
package Controller;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Main {
    
    
    public static void main(String[] args) throws Exception {
        String path1 = "D:/JavaProjects/syntaxAnalyzer/SyntaxAnalyzer/src/Model/Lexer.flex";
        String path2 = "D:/JavaProjects/syntaxAnalyzer/SyntaxAnalyzer/src/Model/LexerCup.flex";
        String[] pathSintax = {"-parser", "Sintax", "D:/JavaProjects/syntaxAnalyzer/SyntaxAnalyzer/src/Model/Sintax.cup"};
        generar(path1, path2, pathSintax);
    }
    public static void generar(String path1, String path2, String[] pathSintax) throws IOException, Exception{
        File file;
        file = new File(path1);
        JFlex.Main.generate(file);
        file = new File(path2);
        JFlex.Main.generate(file);
        java_cup.Main.main(pathSintax);
        
        Path pathSintaxym = Paths.get("D:/JavaProjects/syntaxAnalyzer/SyntaxAnalyzer/src/Model/sym.java");
        if (Files.exists(pathSintaxym)) {
            Files.delete(pathSintaxym);
        }
        Files.move(
                Paths.get("D:/JavaProjects/syntaxAnalyzer/SyntaxAnalyzer/sym.java"), 
                Paths.get("D:/JavaProjects/syntaxAnalyzer/SyntaxAnalyzer/src/Model/sym.java")
        );
        Path pathSintaxintax = Paths.get("D:/JavaProjects/syntaxAnalyzer/SyntaxAnalyzer/src/Model/Sintax.java");
        if (Files.exists(pathSintaxintax)) {
            Files.delete(pathSintaxintax);
        }
        Files.move(
                Paths.get("D:/JavaProjects/syntaxAnalyzer/SyntaxAnalyzer/Sintax.java"), 
                Paths.get("D:/JavaProjects/syntaxAnalyzer/SyntaxAnalyzer/src/Model/Sintax.java")
        );
    }
}
