package inhatc.capstone.cmd.service;

import java.util.ArrayList;

public interface CmdService {
	String inputCommand(int urlNum);
	ArrayList<MV_Rank_DTO> execCMD_MV_Rank(String command) throws InterruptedException;
}
