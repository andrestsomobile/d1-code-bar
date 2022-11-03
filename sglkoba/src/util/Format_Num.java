package util;

public class Format_Num
{
 private String p;
 private String miles;
 private String millones;
 private String decimales; 
 
 public Format_Num()
 {
  p = "0000000,00";
  miles = ".";
  millones = "'";
  decimales = ",";
 }
 
 public Format_Num(String N,String ml,String mll,String dec)
 {
  p = N;
  miles = ml;
  millones = mll;
  decimales = dec;
 }
 
 public static String Invertir(String Num)
 {
  String res = "";
  for(int i = Num.length() - 1;i >= 0 ;i--)
      res = res + String.valueOf(Num.charAt(i));
  return res;
 }
 
 public String F_N()
 {
  String Num = "";
  int pos = -1;                               
  int inf,inf1,i,j = 0;
  /*if(p == "0")
     return p;*/
  for(i = 0;i < p.length();i++)
      if((int)p.charAt(i) == 44)
         pos = i;                                   
  if(pos != -1)
    {
     for(i = p.length() - 1;i > pos;i--)
         Num = Num + String.valueOf(p.charAt(i));
     Num = Num + decimales; 
     pos--;
    }
  else
    pos = p.length() - 1; 
  inf = (pos + 1) / 3;
  inf1 = (pos + 1) % 3;
  for(i = 1;i <= inf;i++)
     { 
      switch(i)
            {
             case(1):for(j = pos;j > (pos - 3);j--)
                         Num = Num + String.valueOf(p.charAt(j)); 
                     if(i != inf)
                        pos = pos - 3;
                     if((i == inf) && (inf1 != 0)) 
                        Num = Num + miles;                 
                     break;
             case(2):Num = Num + miles;
                     for(j = pos;j > (pos - 3);j--)
                         Num = Num + String.valueOf(p.charAt(j));                     
                     if(i != inf)
                        pos = pos - 3;
                     if((i == inf) && (inf1 != 0)) 
                        Num = Num + millones;                               
                     break;
            }
      if(i >= 3)
        {
         Num = Num + millones;
         for(j = pos;j > (pos - 3);j--)
             Num = Num + String.valueOf(p.charAt(j)); 
         if(i != inf)
            pos = pos - 3;
         if((i == inf) && (inf1 != 0)) 
            Num = Num + millones;            
        } 
     }
  if(inf1 != 0)
    {
     if(!(inf == 0))
        pos = pos - 3;     
     Num = Num + String.valueOf(p.charAt(pos));           
     while(pos != 0)
          {
           pos--;
           Num = Num + String.valueOf(p.charAt(pos));           
          }
    }  
  return Invertir(Num);
 
 }
  
}         