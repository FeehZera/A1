class Main {
   static public void main(String argv[]) {
      try {
         parser p = new parser(new Sim10(System.in));
         Object result = p.parse().value;
      } catch (Exception e) {
           e.printStackTrace();
      }
   }
}