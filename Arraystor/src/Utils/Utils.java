package Utils;

public class Utils {
	public static final int[] A = new int[] {7,9,13,1,15,11,17,19};  //数组A
	public static final int NUMBER = 5;    //数组固定扩容长度
	public static int[] C = new int[A.length + NUMBER];    //数组C  利用构造方法进行初始化
	
	
	public int[] b;


	public int[] getB() {
		return b;
	}


	public void setB(int[] b) {
		this.b = b;
	}
	
	
}
