package model;

import java.util.List;

// 評価の投稿に関する処理を行うモデル
public class PostMutterLogic {
	public void execute(Mutter mutter, List<Mutter> mutterList) {
		mutterList.add(0, mutter);
	}
}
