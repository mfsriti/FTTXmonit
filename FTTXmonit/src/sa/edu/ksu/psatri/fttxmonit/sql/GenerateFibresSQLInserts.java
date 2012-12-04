package sa.edu.ksu.psatri.fttxmonit.sql;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import sa.edu.ksu.psatri.fttxmonit.util.ArrayUtils;

public class GenerateFibresSQLInserts {
	public static final int INITIAL_COUNTER = 1000000;
	static int fibreCounter = INITIAL_COUNTER;
	public static void main(String args[]) {
		new GenerateFibresSQLInserts();
	}

	/**
	 * default constructor
	 */
	public GenerateFibresSQLInserts() {
		// load users file
		loadFile();
	}
	
	public void loadFile() {
	
		try {
			FileInputStream fstream = new FileInputStream(CONFIG_FILE);
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			String strLine;
			BufferedWriter fibresFile = openScriptFile("04_populateFibres.sql");
			fibresFile.write(DELETE_FIBRES_STATEMENT+"\n");
			List<String[]> cablesList = null;
			while ((strLine = br.readLine()) != null) {
				cablesList = new LinkedList<String[]>();
				String []cableSet = strLine.split(";");
				for (int j=0; j<cableSet.length; j++){
					boolean useGlobalCounter = false;
					fibreCounter = INITIAL_COUNTER;
					String []cables = cableSet[j].split(",");
					List<String> fibres = new ArrayList<String>();
					for (int i=0; i<cables.length; i++){
						String [] cab = cables[i].split("=");
						fibres.addAll(Arrays.asList(generateInsertsIntoComponents(fibresFile, cab[0], Integer.parseInt(cab[1]),useGlobalCounter)));
						useGlobalCounter = true;
					}
					cablesList.add((String[])fibres.toArray(new String[0]));
				}
				String[][] cablesArray = (String[][])cablesList.toArray(new String[0][0]);
				for (int i=0, size=cablesArray[0].length; i<size; i++)
					generateInsertsSuccPred(fibresFile, cablesArray, i, 0);
				/*
				for (int i=0, size1=cablesArray.length; i<size1; i++) {
					for (int j=0, size2=cablesArray[i].length; j<size2; j++)
						fibresFile.write(cablesArray[i][j]+"\t");
					fibresFile.write("\n");
				}	*/
				cablesList = null;
			}
			in.close();
			closeScriptFile(fibresFile);
		} catch (Exception e) {
			System.err.println("Error: " + e.getMessage());
		}
	}
	
	private BufferedWriter openScriptFile(String filename) throws IOException{
		return new BufferedWriter(new FileWriter(TMP_DIR+filename));
	}
	
	private void closeScriptFile(BufferedWriter bf) throws IOException{
		if (bf != null) {
			bf.flush();
			bf.close();
		}
	}
	
	public void generateScriptFile(BufferedWriter bf, Iterator<String> it) throws IOException{
		if(!it.hasNext())
			return;
		String [] cable = it.next().split("=");
		String cableName = cable[0];
		int cableSize = Integer.parseInt(cable[1]);
		for(int i=0; i<cableSize; i++){
			bf.write(format(INSERT_FIBRE_TEMPLATE, cableName+"_Fibre"+(++fibreCounter), cableName)+"\n");
		}
	}
	
	public String [] generateInsertsIntoComponents(BufferedWriter bf,String cableId, int cableSize, boolean useGlobalCounter) throws IOException {
		String [] result = new String[cableSize];
		fibreCounter = useGlobalCounter ? fibreCounter : INITIAL_COUNTER;
		for(int i=0; i<cableSize; i++){
			result[i] = "Fibre"+(++fibreCounter)+"_"+cableId;
			bf.write(format(INSERT_FIBRE_TEMPLATE, result[i], cableId)+"\n");
		}
		return result;
	}
	
	public void generateInsertsSuccPred(BufferedWriter bf, String [][] cablesArray, int i, int j) throws IOException {
		if (cablesArray.length > j+1 && cablesArray[j+1].length>i){
			bf.write(format(INSERT_SUCCESSOR_TEMPLATE, cablesArray[j][i], cablesArray[j+1][i]));
			bf.write(format(INSERT_PREDECESSOR_TEMPLATE, cablesArray[j+1][i], cablesArray[j][i])+"\n");
			generateInsertsSuccPred(bf, cablesArray, i, ++j);
		}
	}
	
	private String format(String property, String... params){
		return MessageFormat.format(property, params);
	}
	private final static String CONFIG_FILE = "build\\classes\\sa\\edu\\ksu\\psatri\\fttxmonit\\sql\\fibres.config.file.txt";
	private final static String TMP_DIR = "src\\sa\\edu\\ksu\\psatri\\fttxmonit\\sql\\";
	private final static String INSERT_FIBRE_TEMPLATE="INSERT INTO Components(ComponentID, ParentID, ComponentTypeId) VALUES(\"{0}\", \"{1}\", 5005);";
	private final static String INSERT_SUCCESSOR_TEMPLATE="INSERT INTO Successors VALUES(\"{0}\",\"{1}\");";
	private final static String INSERT_PREDECESSOR_TEMPLATE="INSERT INTO Predecessors VALUES(\"{0}\",\"{1}\");";
	private final static String DELETE_FIBRES_STATEMENT="DELETE FROM Components WHERE ComponentID LIKE \"Fibre%\";";

}
