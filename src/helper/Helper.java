package helper;

import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
	
	/*
	 * save product pic
	 */

	

	public static boolean saveFile(InputStream is,String path)
	{
		boolean f=false;
		try {
			byte b[]=new byte[is.available()];
			is.read(b);
			
			FileOutputStream fos=new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			f=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
}
