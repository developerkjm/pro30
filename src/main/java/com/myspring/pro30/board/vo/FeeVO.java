package com.myspring.pro30.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

import com.myspring.pro30.member.vo.MemberVO;

@Component("feeVO")
public class FeeVO {
	private int feeNo;
	private int feeMonthly;
	private String feeRemark;
	private Date  feeDate;
	private String feeId;
	private String imageFileName;
	
	
	private String name = new MemberVO().getName();
	private String id = new MemberVO().getId();
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public FeeVO() {
		System.out.println("FeeVO 생성자" + name);
	}
	public int getFeeNo() {
		return feeNo;
	}

	public void setFeeNo(int feeNo) {
		this.feeNo = feeNo;
	}

	public int getFeeMonthly() {
		return feeMonthly;
	}

	public void setFeeMonthly(int feeMonthly) {
		this.feeMonthly = feeMonthly;
	}

	public String getFeeRemark() {
		return feeRemark;
	}

	public void setFeeRemark(String feeRemark) {
		this.feeRemark = feeRemark;
	}

	public Date getFeeDate() {
		return feeDate;
	}

	public void setFeeDate(Date feeDate) {
		this.feeDate = feeDate;
	}

	public String getFeeId() {
		return feeId;
	}

	public void setFeeId(String feeId) {
		this.feeId = feeId;
	}

	public String getImageFileName() {
		try {
			if (imageFileName != null && imageFileName.length() != 0) {
				imageFileName = URLDecoder.decode(imageFileName, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return imageFileName;
	}
	
	public void setImageFileName(String imageFileName) {
		try {
			if(imageFileName!= null && imageFileName.length()!=0) {
				this.imageFileName = URLEncoder.encode(imageFileName,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
}