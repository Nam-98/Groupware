package kh.gw.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kh.gw.dao.MemberDAO;
import kh.gw.dto.DepartmentDTO;
import kh.gw.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO mdao;
	@Autowired 
	private ServletContext servletContext;
	
	public int loginCheck(MemberDTO dto) throws Exception{
		String result = mdao.loginCheck(dto);
		if(result!=null) {return 1;}
		else return 0;
	}
	
	public MemberDTO getMemInfo(String id) throws Exception{
		return mdao.getMemInfo(id);
	}
	
	public List<MemberDTO> listMem() throws Exception{
		return mdao.listMem();
	}
	
	public List<DepartmentDTO> listDept() throws Exception{
		return mdao.listDept();
	}
	public Map<String,Object> getMyInfo(String id) throws Exception{
		return mdao.getMyInfo(id);
	}
	public int insertMem(MemberDTO dto) throws Exception{
		return mdao.insertMem(dto);
	}
	public void updateMemList(List<MemberDTO> list) throws Exception {
		for(MemberDTO dto : list) {
			mdao.updateMemInfo(dto);
		}
	}
	public void insertProfile(MultipartFile profilePic, String id) throws IOException {
		String realPath = servletContext.getRealPath("/resources/profileImage");
		//String dir2 = "C:\\nexacro\\workspace_final\\Groupware\\src\\main\\webapp\\resources\\profileImage";
		File filesPath = new File(realPath);
		
		if(!filesPath.exists()) {filesPath.mkdir();}
		
		File targetLoc = new File(filesPath.getAbsoluteFile()+"/"+id + ".png");
		FileCopyUtils.copy(profilePic.getBytes(), targetLoc);
		
		System.out.println(targetLoc.length());
		BufferedImage originalImage = ImageIO.read(targetLoc); 
		int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType(); 
		System.out.println("originFile Height : " + originalImage.getHeight()); 
		System.out.println("originFile Width : " + originalImage.getWidth()); 
		BufferedImage resizeImagePng = resizeImage(originalImage, type); 
		ImageIO.write(resizeImagePng, "png", originFile); 
		BufferedImage resigeImage = ImageIO.read(originFile);
		
		System.out.println("==========================================================="); 
		File resizeFile = new File(imgOriginalPath); 
		System.out.println("resizeFile Length : " + resizeFile.length()); 
		System.out.println("resizeFile Height : " + resigeImage.getHeight()); 
		System.out.println("resizeFile Width : " + resigeImage.getWidth());
	}
	
	public BufferedImage resize() {
		BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type); 
		Graphics2D g = resizedImage.createGraphics(); 
		g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null); 
		g.dispose(); 
		return resizedImage;
	}
}
