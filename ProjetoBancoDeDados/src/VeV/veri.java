/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package VeV;

import DaoLogin.Exception;
import DaoLogin.String;

/**
 *
 * @author hallisson
 */
public class veri {
    public static void main (String args[]){
        
        
    }
    public boolean validarLogin(String logim,String senha) throws Exception{
    	  String g;
          g = String g = "[A-Z]{1}[a-z]+[0-9]+[@!#]{1}";;
          
          return logim.matches(g)+senha.matches(g) ;
          
    }
        
     
}

