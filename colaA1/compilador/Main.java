import java.io.*;
import java.io.FileInputStream;

class Main {
    static public void main(String argv[]) {
        try {
            Scanner scanner = new Scanner(System.in);
            parser p = new parser(scanner);
            Object result = p.parse().value;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}