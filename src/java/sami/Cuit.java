package sami;

public final class Cuit {

    private static final String coef = "5432765432"; //coeficiente
    
//método para determinar el CUIT
    public static boolean validar(String numCUIT) {
        try {          
            if (numCUIT==null || numCUIT.length()!=11) {                
                return false;
            }            
            Long esNum = Long.valueOf(numCUIT);
            
            int su = 0;
            int lCuit = numCUIT.length();            
            for (int i = 1; i < 11; i++) {
                String Cd1 = coef.substring(i - 1, i);
                String Cd2 = numCUIT.substring(i - 1, i);
                int cf = Integer.parseInt(Cd1); //casteo...
                int ct = Integer.parseInt(Cd2); //casteo...
                su += (cf * ct);
            }
            int md = su / 11;
            int re = su - (md * 11);
            if (re > 1) {
                re = 11 - re;
            }
            String CdDv = numCUIT.substring(lCuit - 1, lCuit);
            int dv = Integer.parseInt(CdDv); //casteo...
            if (dv == re) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }
    }
}