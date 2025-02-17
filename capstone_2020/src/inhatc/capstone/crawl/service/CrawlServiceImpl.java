package inhatc.capstone.crawl.service;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;


@Service("crawlService")
public class CrawlServiceImpl implements CrawlService{
	private List<List<String>> ret = new ArrayList<List<String>>();
    private BufferedReader br = null;
    
	@Override
	public void readCSV(String path) {
		// TODO Auto-generated method stub
		try{
            br = Files.newBufferedReader(Paths.get(path));
            //Charset.forName("UTF-8");
            String line = "";
            
            while((line = br.readLine()) != null){
                //CSV 1행을 저장하는 리스트
                List<String> tmpList = new ArrayList<String>();
                
                String array[] = line.split("\\|");
                //배열에서 리스트 반환
                //System.out.println(array[0]);
                
                tmpList = Arrays.asList(array);
                //System.out.println(tmpList);
                ret.add(tmpList);
            }
            
        }catch(FileNotFoundException e){
            e.printStackTrace();
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            try{
                if(br != null){
                    br.close();
                }
            }catch(IOException e){
                e.printStackTrace();
            }
        }
	}

	@Override
	public List<List<String>> getCSV() {
		// TODO Auto-generated method stub
		return ret;
	}

}
