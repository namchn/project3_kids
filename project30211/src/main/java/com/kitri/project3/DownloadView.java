package com.kitri.project3;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView { //뷰모양만들어서 뷰객체 만들때 뷰틀을만들어놓은 클래스(AbstractView)상속

	public DownloadView() {
		setContentType("application/download; charset=utf-8"); //보여줄 마인타입
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		File file = (File) model.get("downloadFile"); //다운로드파일 이름정보downloadFile인 파일객체를 얻어오다

		response.setContentType(getContentType());
		response.setContentLength((int) file.length()); //파일길이읽어오다

		String userAgent = request.getHeader("User-Agent"); //
		boolean ie = userAgent.indexOf("MSIE") > -1;
		String fileName = null;
		if (ie) {
			fileName = URLEncoder.encode(file.getName(), "utf-8");
		} else {
			fileName = new String(file.getName().getBytes("utf-8"), "iso-8859-1");
		}
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";"); //첨부할파일으름 붙여서
		response.setHeader("Content-Transfer-Encoding", "binary"); //바이너리타입으로 지정
		OutputStream out = response.getOutputStream(); //객체 복사 출력하기위해
		FileInputStream fis = null; //파일에서부터 읽은것 출력
		try {
			fis = new FileInputStream(file); //파일복사하여보내다
			FileCopyUtils.copy(fis, out);
		} finally {
			if (fis != null)
				try {
					fis.close();
				} catch (IOException ex) {
				}
		}
		out.flush(); //버퍼강제적출력 (풀버퍼 버퍼가 가득차면 비워주다(출력하다)/ 라인버퍼 엔터가 들어가야 버퍼를 비워주다)
	}

}
