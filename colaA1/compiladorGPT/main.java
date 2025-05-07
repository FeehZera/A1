import java.io.*;

public class Main {
    public static void main(String[] args) {
        try {
            Reader reader = new InputStreamReader(System.in);
            Scanner scanner = new Scanner(reader);
            Parser parser = new Parser(scanner);

            System.out.println("Digite uma expressão:");
            int resultado = (int) parser.parse().value;
            System.out.println("Resultado: " + resultado);
        } catch (Exception e) {
            System.err.println("Erro: " + e.getMessage());
        }
    }
}
