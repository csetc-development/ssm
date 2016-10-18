package com.icss.bean;

public class Score {
    private String sid;

    private String stage;
    
    private Integer etcid;

    private String score;

    private String appraisedate;

    public Score() {
	}

	public Score(String sid, String stage,Integer etcid, String score, String appraisedate) {
		this.sid = sid;
		this.stage = stage;
		this.etcid = etcid;
		this.score = score;
		this.appraisedate = appraisedate;
	}

    public String getSid() {
        return sid;
    }
    
	public void setSid(String sid) {
        this.sid = sid == null ? null : sid.trim();
    }

    public String getStage() {
        return stage;
    }

    public void setStage(String stage) {
        this.stage = stage == null ? null : stage.trim();
    }
    
	public Integer getEtcid() {
		return etcid;
	}

	public void setEtcid(Integer etcid) {
		this.etcid = etcid;
	}

	public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score == null ? null : score.trim();
    }

    public String getAppraisedate() {
        return appraisedate;
    }

    public void setAppraisedate(String appraisedate) {
        this.appraisedate = appraisedate == null ? null : appraisedate.trim();
    }
}