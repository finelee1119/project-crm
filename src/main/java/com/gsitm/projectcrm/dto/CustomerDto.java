package com.gsitm.projectcrm.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CustomerDto {
	private Long CUST_SN; // 고객 일련번호
	private String CUST_NM; // 고객명
	private String EML_ADDR; // 이메일 주소
	private char BRDT; // 생년월일
	private String HOME_TELNO; // 자택 전화번호
	private String MBL_TELNO; // 휴대 전화번호
	private char PRIDTF_NO; // 개인식별 번호
	private String CR_NM; // 직업명
	private String ROAD_NM_ADDR; // 도로명주소
	private String PIC_SN_VL; // 담당자 일련번호 값 (타 테이블에서 일련번호 사용을 위한 임시 용어)
	private String TKCG_DEPT_NM; // 담당 부서명
	private char FRST_REG_DT; // 최초 등록 일시 (CURRENT_DATE)
	private double FRST_RGTR_SN; // 최초 등록자 일련번호
	private char LAST_MDFCN_DT; // 최종 수정 일시
	private char USE_YN; // 사용여부
}