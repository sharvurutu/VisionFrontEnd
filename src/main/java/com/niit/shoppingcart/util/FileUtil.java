package com.niit.shoppingcart.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.jboss.logging.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {

	//private static Logger log = LoggerFactory.getLogger(FileUtil.class);
	
	public static void upload(String path, MultipartFile file, String fileName)
	{
		//log.debug("Starting of the method upload");
		//log.debug("path: "+ path);
		//log.debug("fileName: " + fileName);
		if(!file.isEmpty())
		{
			try
			{
				byte[] bytes =file.getBytes();
				
				//Creating directory to store file
				File dir = new File(path);
				if(!dir.exists())
					dir.mkdirs();
				
				//Create the file on server
				File serverFile = new File(dir.getAbsolutePath()+File.separator+fileName);
				BufferedOutputStream stream=new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				//log.info("server file location="+serverFile.getAbsolutePath());
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			//log.debug("Ending of the method upload");
		}
	}
}
