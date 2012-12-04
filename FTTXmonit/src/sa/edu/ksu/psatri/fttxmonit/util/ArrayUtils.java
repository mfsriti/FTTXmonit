package sa.edu.ksu.psatri.fttxmonit.util;

public class ArrayUtils {
	public static String toJavaScriptArray(float[] array){
		String arrayStr = "[";
		if ( array!=null ){
			for(int i=0; i<array.length; i++ ){
				arrayStr+=array[i];
	    		if(i<array.length-1)
	    			arrayStr+=",";
        	}
		}
		arrayStr+="]";
		return arrayStr;
	}
	public static String toJavaScriptArray(float[][] array){
		String arrayStr = "[";
		if ( array!=null ){
			for(int i=0; i<array.length; i++ ){
				arrayStr+=toJavaScriptArray(array[i]);
	    		if(i<array.length-1)
	    			arrayStr+=",";
        	}
		}
		arrayStr+="]";
		return arrayStr;
	}
	public static String toJavaScriptArray(float[][][] array){
		String arrayStr = "[";
		if ( array!=null ){
			for(int i=0; i<array.length; i++ ){
				arrayStr+=toJavaScriptArray(array[i]);
	    		if(i<array.length-1)
	    			arrayStr+=",";
        	}
		}
		arrayStr+="]";
		return arrayStr;
	}
	/*	out.print("[");
	if ( areas!=null ){
		for(int i=0; i<areas.length; i++ ){
    		out.print("["+areas[i][0]+","+areas[i][1]+"]");
    		if(i<areas.length-1)
    			out.print(",");
    	}
	}
	out.print("]");
*/
}
