package com.niit.shoppingcart.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;


public class FileUtil {
	public static Logger log = LoggerFactory.getLogger(FileUtil.class.getName());

	public static void Upload(String path,MultipartFile file,String filename)
	{
		log.debug("FileUtil ---> Starting of the Method DisplayAllCart()");

		if(!file.isEmpty()){
			
			try{
				byte[] bytes = file.getBytes();
				File dir = new File(path);
				if(!dir.exists())
				{
					dir.mkdirs();
				}
				File ServerFile = new File(dir.getAbsolutePath()+File.separator +filename);

				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(ServerFile));
			stream.write(bytes);
			stream.close();
			log.debug("FileUtil ---> Ending of the Method DisplayAllCart()");

			}
catch(Exception e)
			{
	e.printStackTrace();
	System.out.println(e);
	log.debug("FileUtil ---> Ending of the Method DisplayAllCart()");

			}
		}
		
	}
	
	}
