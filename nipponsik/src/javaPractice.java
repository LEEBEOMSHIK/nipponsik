
public class javaPractice {

	public static void main(String[] args) {
		int sum = 0;
		for(int i =0; i<31; i++) {
			if(i%4!=0 && i%5!=0) {
				sum += i;
				System.out.println(i);
			}
		}
		System.out.println(sum);
	}

}
