int lineCounter=0;
int addedletters=0;
String lines[];
public void setup() {
	lines = loadStrings("LowellHymn.txt");
	System.out.println("there are " + lines.length + " lines");
}
public void draw()
{
	if(lineCounter<lines.length)
		System.out.println(lineConvert(lines[lineCounter]));
	lineCounter++;
}
public String lineConvert(String sWord)
{
	String returnable = new String();
	ArrayList<WordBundle> wordList = new ArrayList<WordBundle>();
	wordList.add(new WordBundle(0));
	int wordListNum = 0;
	for(int lp1=0;lp1<sWord.length();lp1++)
	{
		if(Character.isLetter(sWord.charAt(lp1))||sWord.charAt(lp1)=='\''||sWord.charAt(lp1)=='-')
			wordList.get(wordListNum).setWord(wordList.get(wordListNum).getWord()+sWord.charAt(lp1));
		else
		{
			wordListNum++;
			wordList.add(new WordBundle(0));
		}
	}
	return sWord;
}
public int findFirstVowel(String sWord)
{
	String [] mainVowels = {"a","e","i","o","u"};
	for(int lp1=0;lp1<sWord.length();lp1++)
	{
		for(int lp2=0;lp2<mainVowels.length;lp2++)
		{
			if(sWord.substring(lp1,lp1+1).equals(mainVowels[lp2]))
			{
				return lp1;
			}
		}
	}
	return -1;
}
public String pigLatin(String sWord)
{
	int vowelPlace = findFirstVowel(sWord);
	if(vowelPlace == -1)
	{
		addedletters = 2;
		return sWord + "ay";
	}
	else if(vowelPlace==0)
	{
		addedletters = 3;
		return sWord + "way";
	}
	else if(vowelPlace>=1)
	{
		addedletters=2;
		if(sWord.charAt(1)=='u'&&sWord.charAt(0)=='q'){return sWord.substring(2,sWord.length())+"quay";}
		else{return sWord.substring(vowelPlace,sWord.length())+sWord.substring(0,vowelPlace)+"ay";}
	}
	else{return "ERROR";}
}
class WordBundle
{
	private int location;
	private String word;
	public WordBundle(int inputLocation)
	{
		location = inputLocation;
		word = new String();
	}
	public getLocation(){return location;}
	public getWord(){return word;}
	public setWord(String inputWord){word=inputWord;}
}