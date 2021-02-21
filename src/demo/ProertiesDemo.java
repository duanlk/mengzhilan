package demo;

import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

public class ProertiesDemo {

	public static void main(String[] args) {
		Set<Object> states;
		String str;
		Properties captials = new Properties();
		captials.put("中国 ","北京");
		captials.put("莫斯科","莫斯科");
		captials.put("日本","东京");
		captials.put("法国","巴黎");
		captials.put("英国","伦敦");
	
		states = captials.keySet();	// 返回一个键的Set集合
		Iterator<Object> itr = states.iterator();
		while(itr.hasNext()){
			str = (String)itr.next();
			System.out.println("国家：" + str + "，首都：" + captials.get(str));
		}
		System.out.println();
		
		// 如果"美国"该键不存在，则返回默认值
		str = captials.getProperty("美国","没有发现");
		System.out.println("美国的首都：" + str);
	}
	
}