package insertBArray;

import Utils.Utils;


import java.util.Scanner;

public class InsertBArray {

	private static Scanner input = new Scanner(System.in);
	
	public int[] B() {
		
		int[] B = new int[Utils.NUMBER];
		for(int i = 0;i < B.length;i++) {
			System.out.println("�����볤��Ϊ5������,"+(i+1)+"�±�����b���ݣ�");
			B[i]= input.nextInt();
			
		}
		
		 for (int i = 1; i <=B.length-1; i++) {
	            for (int j = 0; j <=B.length-i-1; j++) {
	                if (B[j]>B[j+1]){
	                    int t=B[j];
	                    B[j]=B[j+1];
	                    B[j+1]=t;
	                }
	            }
	        }
		return B;
	}
}
