package service;

import java.util.Scanner;

import Utils.Utils;
import insertBArray.InsertBArray;

public class Service {
	
	public static Scanner input = new Scanner(System.in);
	
	
	public static void ArrayC() {
		String dou = ",";
		System.out.print("数组a:[");
		for (int i = 0; i < Utils.A.length; i++) {
			if(i >= Utils.A.length - 1) {
				dou = "";
			}
			System.out.print(Utils.A[i] +dou);
		}
		System.out.println("]");
		
		InsertBArray jk = new InsertBArray();
		int[] op = jk.B();
		int index;
		boolean bool = false;
		do {
			System.out.println("请输入插入到数组a的位置(0-8)：");
			index = input.nextInt();
			if(index < 0 || index > 8) {
				System.out.println("插入位置有误! ! !");
				bool = true;
			}else {
				bool = false;
			}
		} while (bool);
		int max = 0;
		int[] a = Utils.A;
		for (int i = 0; i < index-1; i++) {
			for (int j = 0; j < index-i-1; j++) {
				if(a[j + 1] > a[j]) {
					max = a[j];
					a[j]  = a[j +1];
					a[j +1] = max;
				}
			}
		}
		for (int i = 0; i < index; i++) {
			Utils.C[i] = a[i];
		}
		

		for (int o = 0; o < op.length; o++) {
			Utils.C[o +index] = op[o];
		}
		
		int b = index + Utils.NUMBER;  //
		int c = Utils.C.length - b;
		for (int k = 0 ; k < c-1 ; k++) {
			for (int u = 0; u < c - k-1; u++) {
				if(a[index + 1 + u] < a[u + index]) {
					max = a[u + index];
					a[u +index]  = a[u +1 + index];
					a[u +1 +index] = max;
				}
			}
		}
		
		for (int i = 0; i < c; i++) {
			Utils.C[i + b] = a[i+index];
		}
		String dou1 = ",";
		System.out.print("新数组c:[");
		for (int u = 0; u < Utils.C.length; u++) {
			if(u >= Utils.C.length - 1) {
				dou1 = "";
			}
			System.out.print(Utils.C[u] +dou1);
		}
		System.out.println("]");
	}
	
}
