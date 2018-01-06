package ch3;

import java.util.Random;

public class FruitGenerator implements Generator<String> {
	private String[] fruits = new String[]{"Apple", "Banana", "Pear"};

    @Override
    public String next() {
        Random rand = new Random();
        return fruits[rand.nextInt(3)];
    }
    
    public static void main(String[] args){
    	FruitGenerator fruit = new FruitGenerator();
    	System.out.println(fruit.next());
    	System.out.println(fruit.next());
    	System.out.println(fruit.next());
    }
}
