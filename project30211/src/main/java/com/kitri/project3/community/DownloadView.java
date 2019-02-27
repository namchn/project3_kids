package com.kitri.project3.community;

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

public class DownloadView extends AbstractView {

	public DownloadView() {
		setContentType("application/download; charset=utf-8");
	}

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		File file = (File) model.get("downloadFile");	// 다운로드하려고 선택한 파일

		response.setContentType(getContentType());
		response.setContentLength((int) file.length());

		String userAgent = request.getHeader("User-Agent");	// 헤더정보얻어옴 - 인코딩 등을 위함
		boolean ie = userAgent.indexOf("MSIE") > -1;
		String fileName = null;
		if (ie) {	// 파일 이름 인코딩
			fileName = URLEncoder.encode(file.getName(), "utf-8");
		} else {
			fileName = new String(file.getName().getBytes("utf-8"),
					"iso-8859-1");
		}
		response.setHeader("Content-Disposition", "attachment; filename=\""
				+ fileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		OutputStream out = response.getOutputStream();	// response로 복사하여 보냄
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		} finally {
			if (fis != null)
				try {
					fis.close();
				} catch (IOException ex) {
			}
		}
		out.flush();	// 버퍼 내용을 강제적으로 출력 full-buffer 가득차면 출력, line-buffer 엔터들어가면 출력  네트워크에서는 항상 flush하는 게 안전 
	}
}
