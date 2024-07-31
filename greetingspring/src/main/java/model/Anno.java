package model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Anno {
   int annoId;
   String businessName;
   String welfare;
   String annoTitle;
   String annoCareer;
   String annoSalary;
   String annoEdu;
   String annoGrade;
   String annoWorkType;
   String annoWorkDay;
   String annoWorkPlace;
   String annoCommon;
   String annoQualification;
   String annoPickNum;
   Date annoDate = new Date();;
   String annoContent;
   String businessId;
   int skillId;
   
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   Date annoDeadline;
   
   int resumeCount;
   long daysLeft;
   String annoDeadlineStr;
   
   public int getAnnoId() {
      return annoId;
   }
   public void setAnnoId(int annoId) {
      this.annoId = annoId;
   }
   public String getBusinessName() {
      return businessName;
   }
   public void setBusinessName(String businessName) {
      this.businessName = businessName;
   }
   public String getWelfare() {
      return welfare;
   }
   public void setWelfare(String welfare) {
      this.welfare = welfare;
   }
   public String getAnnoTitle() {
      return annoTitle;
   }
   public void setAnnoTitle(String annoTitle) {
      this.annoTitle = annoTitle;
   }
   public String getAnnoCareer() {
      return annoCareer;
   }
   public void setAnnoCareer(String annoCareer) {
      this.annoCareer = annoCareer;
   }
   public String getAnnoSalary() {
      return annoSalary;
   }
   public void setAnnoSalary(String annoSalary) {
      this.annoSalary = annoSalary;
   }
   public String getAnnoEdu() {
      return annoEdu;
   }
   public void setAnnoEdu(String annoEdu) {
      this.annoEdu = annoEdu;
   }
   public String getAnnoGrade() {
      return annoGrade;
   }
   public void setAnnoGrade(String annoGrade) {
      this.annoGrade = annoGrade;
   }
   public String getAnnoWorkType() {
      return annoWorkType;
   }
   public void setAnnoWorkType(String annoWorkType) {
      this.annoWorkType = annoWorkType;
   }
   public String getAnnoWorkDay() {
      return annoWorkDay;
   }
   public void setAnnoWorkDay(String annoWorkDay) {
      this.annoWorkDay = annoWorkDay;
   }
   public String getAnnoWorkPlace() {
      return annoWorkPlace;
   }
   public void setAnnoWorkPlace(String annoWorkPlace) {
      this.annoWorkPlace = annoWorkPlace;
   }
   public String getAnnoCommon() {
      return annoCommon;
   }
   public void setAnnoCommon(String annoCommon) {
      this.annoCommon = annoCommon;
   }
   public String getAnnoQualification() {
      return annoQualification;
   }
   public void setAnnoQualification(String annoQualification) {
      this.annoQualification = annoQualification;
   }
   public String getAnnoPickNum() {
      return annoPickNum;
   }
   public void setAnnoPickNum(String annoPickNum) {
      this.annoPickNum = annoPickNum;
   }
   public Date getAnnoDate() {
      return annoDate;
   }
   public void setAnnoDate(Date annoDate) {
      this.annoDate = annoDate;
   }
   public String getAnnoContent() {
      return annoContent;
   }
   public void setAnnoContent(String annoContent) {
      this.annoContent = annoContent;
   }
   public String getBusinessId() {
      return businessId;
   }
   public void setBusinessId(String businessId) {
      this.businessId = businessId;
   }
   public int getSkillId() {
      return skillId;
   }
   public void setSkillId(int skillId) {
      this.skillId = skillId;
   }
   public Date getAnnoDeadline() {
      return annoDeadline;
   }
   public void setAnnoDeadline(Date annoDeadline) {
      this.annoDeadline = annoDeadline;
   }
   public int getResumeCount() {
      return resumeCount;
   }
   public void setResumeCount(int resumeCount) {
      this.resumeCount = resumeCount;
   }
   public long getDaysLeft() {
      return daysLeft;
   }
   public void setDaysLeft(long daysLeft) {
      this.daysLeft = daysLeft;
   }
   
   public String getAnnoDeadlineStr() {
      return annoDeadlineStr;
   }
   public void setAnnoDeadlineStr(String annoDeadlineStr) {
      this.annoDeadlineStr = annoDeadlineStr;
   }
   @Override
   public String toString() {
      return "Anno [annoId=" + annoId + ", businessName=" + businessName + ", welfare=" + welfare + ", annoTitle="
            + annoTitle + ", annoCareer=" + annoCareer + ", annoSalary=" + annoSalary + ", annoEdu=" + annoEdu
            + ", annoGrade=" + annoGrade + ", annoWorkType=" + annoWorkType + ", annoWorkDay=" + annoWorkDay
            + ", annoWorkPlace=" + annoWorkPlace + ", annoCommon=" + annoCommon + ", annoQualification="
            + annoQualification + ", annoPickNum=" + annoPickNum + ", annoDate=" + annoDate + ", annoContent="
            + annoContent + ", businessId=" + businessId + ", skillId=" + skillId + ", annoDeadline=" + annoDeadline
            + ", resumeCount=" + resumeCount + ", daysLeft=" + daysLeft + "]";
   }


   


}