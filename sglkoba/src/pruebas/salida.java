package pruebas;
import util.Fecha;
import java.io.*;
import java.awt.*;

public class salida {
	public static void main(String[] args)
	{
		Fecha hoy = new Fecha();
		hoy.getFecha();
		System.out.println("ahi ve....."+hoy.getFecha());
		System.out.println("ahi ve....."+hoy.getFechaSinHora());
	}

}
