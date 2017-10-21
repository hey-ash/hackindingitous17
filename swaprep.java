import java.util.Random;

// parse through the text
// create libraries of each of the themes
// clump the words, identify the most prominent words, classify into the theme based on the most frequently used words
// create dictionaries, lists for each of the images in the themes
// assign the entry to one of the dictionaries

// alternatively, 

public 

public String getMeme(String memo){
	//images list
	String[] adimages = new String["1.jpeg", "4.jpeg", "9.jpeg", "15.jpeg", "16.jpeg", "18.jpeg", "21.jpeg", "22.jpeg", "23.jpeg", "24.jpeg", "27.jpeg", "28.jpeg", "29.jpeg", "30.jpeg"];
	String[] acimages = new String["1.jpeg", "4.jpeg", "7.jpeg", "8.jpeg", "10.jpeg", "11.jpeg", "12.jpeg", "13.jpeg", "14.jpeg", "16.jpeg", "18.jpeg", "19.jpeg", "20.jpeg", "21.jpeg", "22.jpeg", "23.jpeg", "24.jpeg", "26.jpeg", "27.jpeg", "28.jpeg", "29.jpeg", "30.jpeg", "31.jpeg", "32.jpeg"];
	String[] emimages = new String["1.jpeg", "4.jpeg", "9.jpeg", "11.jpeg", "12.jpeg", "13.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "18.jpeg", "19.jpeg", "20.jpeg", "21.jpeg", "22.jpeg", "23.jpeg", "24.jpeg", "26.jpeg", "27.jpeg", "28.jpeg", "29.jpeg", "30.jpeg", "31.jpeg", "32.jpeg"];
	String[] eximages = new String["8.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "18.jpeg", "19.jpeg", "21.jpeg", "22.jpeg", "23.jpeg", "24.jpeg", "26.jpeg", "27.jpeg", "28.jpeg", "29.jpeg", "30.jpeg", "31.jpeg", "32.jpeg"];
	String[] reimages = new String["2.jpeg", "5.jpeg", "6.jpeg", "7.jpeg", "9.jpeg", "10.jpeg", "11.jpeg", "12.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "18.jpeg", "23.jpeg", "25.jpeg", "30.jpeg"];
	String[] rellimages = new String["6.jpeg", "7.jpeg", "12.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "18.jpeg", "23.jpeg", "25.jpeg", "27.jpeg", "30.jpeg"];
	String[] thimages = new String["6.jpeg", "9.jpeg", "11.jpeg", "12.jpeg", "14.jpeg", "15.jpeg", "16.jpeg", "17.jpeg", "18.jpeg", "21.jpeg", "23.jpeg", "25.jpeg", "27.jpeg", "29.jpeg", "30.jpeg", "32.jpeg"];
	
	String[] admiration = new String["you", "admire", "my", "mom", "is", "so", "amazing", "sent", "me", "food", "drove", "all", "way", "here", "deliver", "today", "saw", "someone", "help", "this", "homeless", "person", "always", "awe", "humanity", "people", "care", "each", "other", "every", "day", "admire", "God", "work", "world", "morning", "helped", "solve", "really", "difficult", "problem", "grateful", "they", "for", "I"];
	String[] accomplishment = new String["I", "made", "A", "my", "exam", "so", "blessed", "because", "think", "would", "do", "well", "today", "one", "business", "exams", "expecting", "it", "difficult", "proud", "myself"];
	String[] empowerment = new String["encouraged", "me", "become", "better", "person", "even", "though", "my", "day", "really", "long", "tired", "literally", "entire", "day", "able", "power", "through", "everything", "get", "through", "day", "while", "still", "feeling", "energized"];
	String[] excitement = new String["I", "got", "into", "really", "excited", "about", "all", "that", "future", "holds", "because", "out", "my", "outcomes", "will", "be", "good"];
	String[] reflective = new String["I", "realized", "that", "had", "very", "blessed", "childhood", "because", "grew", "up", "in", "great", "family", "environment", "know", "not", "everyone", "really", "lucky", "life", "fortunate", "have", "roof", "over", "head", "meal", "my", "table", "every", "day", "so", "blessed", "have", "this", "amazing", "life"];
	String[] relief = new String["I", "did", "not", "study", "for", "my", "exam", "but", "I", "did", "okay", "car", "almost", "ran", "me", "over", "but", "after", "lot", "prayer", "really", "relieved", "friend", "hospital", "after", "his", "injuries", "today", "almost", "accident", "which", "might", "have", "resulted", "people", "injured", "thankfully", "nothing", "went", "wrong", "okay"];
	String[] thankful = new String["my", "friend", "gave", "me", "present", "it", "was", "water", "bottle", "thankful", "for", "all", "that", "my", "family", "provided", "me", "in", "terms", "of", "love", "support", "today", "friends", "supported", "tough", "time", "life", "thankful", "support", "there"];
	int totalwordcounts = 0;
	int admirationcounts = 0;
	int accomplishmentcounts = 0;
	int empowermentcounts = 0;
	int excitementcounts = 0;
	int reflectivecounts = 0;
	int reliefcounts = 0;
	int thankfulcounts = 0;
	String[] parts = memo.split();
	int memosize = parts.size();
	for (int i = 0, i <= memosize - 1, i++){
		int adlen = admiration.size();
		int aclen = accomplishment.size();
		int emlen = empowerment.size();
		int exlen = excitement.size();
		int relen = reflective.size();
		int rellen = relief.size();
		int thlen = thankful.size();
		
		totalwordcounts ++;
		for (int = 0, j <= adlen, i ++){
			if (parts[i] == admiration[j]){
				admirationcounts ++;
			}
		}
		for (int = 0, j <= aclen, i ++){
			if (parts[i] == accomplishment[j]){
				accomplishmentcounts ++;
			}
		}
		for (int = 0, j <= emlen, i ++){
			if (parts[i] == empowerment[j]){
				empowermentcounts ++;
			}
		}
		for (int = 0, j <= exlen, i ++){
			if (parts[i] == excitement[j]){
				excitementcounts ++;
			}
		}
		for (int = 0, j <= relen, i ++){
			if (parts[i] == reflective[j]){
				reflectivecounts ++;
			}
		}
		for (int = 0, j <= rellen, i ++){
			if (parts[i] == relief[j]){
				reliefcounts ++;
			}
		}
		for (int = 0, j <= thlen, i ++){
			if (parts[i] == thankful[j]){
				thankfulcounts ++;
			}
		}
		//checkList(parts[i], admiration, accomplishment, empowerment, excitement, reflective, relief, thankful);
	}
	int[] counts = new [admirationcounts, accomplishmentcounts, empowermentcounts, excitementcounts, reflecitvecounts, reliefcounts, thankfulcounts];
	int maxcounts = Collections.max(counts); 
	if (admirationcounts == maxcounts){
		int  n = rand.nextInt(adlen) + 1;
		return adimages[n];
	}
	if (accomplishmentcounts == maxcounts){
		int  n = rand.nextInt(aclen) + 1;
		return acimages[n];
	}
	if (empowermentcounts == maxcounts){
		int  n = rand.nextInt(emlen) + 1;
		return emimages[n];
	}
	if (excitementcounts == maxcounts){
		int  n = rand.nextInt(exlen) + 1;
		return eximages[n];
	}
	if (reflectivecounts == maxcounts){
		int  n = rand.nextInt(relen) + 1;
		return reimages[n];
	}
	if (reliefcounts == maxcounts){
		int  n = rand.nextInt(relllen) + 1;
		return reliefimages[n];
	}
	if (thankfulcounts == maxcounts){
		int  n = rand.nextInt(thlen) + 1;
		return thimages[n];
	}
	
}