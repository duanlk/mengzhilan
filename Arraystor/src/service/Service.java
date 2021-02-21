package service;

import java.util.Scanner;

import Utils.Utils;
import insertBArray.InsertBArray;

public class Service {
	
	public static Scanner input = new Scanner(System.in);
	
	
	public static void ArrayC() {
		InsertBArray jk = new InsertBArray();
		int[] op = jk.B();
		System.out.println("请输入插入到数组a的位置：");
		int index = input.nextInt();
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
			System.out.println(Utils.C[i]);
		}
		

		for (int o = 0; o < op.length; o++) {
			Utils.C[o +index] = op[o];
			System.out.println(Utils.C[o +index]);
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
			System.out.println(Utils.C[i + b]);
		}
	}
	public static void main(String[] args) {
		Service.ArrayC();
	}
}
