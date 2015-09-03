package com.suascamera.app;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class ErrorManager 
{
	public static void alert(Exception e) throws Exception
	{
		try 
		{
			PrintWriter out = new PrintWriter(Backend.currentDirectory.getPath() + File.separator + "ErrorLog.txt");
			out.println(e.getLocalizedMessage());
			out.close();
			
			throw e;
		}
		catch (FileNotFoundException e1) 
		{
			e1.printStackTrace();
		}
	}
}
