import java.util.*;
int lineCounter=0;
String lines[];
public void setup() {
	String lines[] = loadStrings("LowellHymn.txt");
	System.out.println("there are " + lines.length + " lines");
}
public void draw()
{
	System.out.println(lineConvert(lines[lineCounter]));
	lineCounter++;
}
public String lineConvert(String sWord)
{
	System.out.println("here");
	String [] mainLetters = loadStrings("letters.txt");
	int wordStartInt=0;
	System.out.println("here1");
	while(wordStartInt<sWord.length())
	{
		String returnWord = new String();
		for(int lp1=wordStartInt;lp1<sWord.length();lp1++)
		{
			for(int lp2=0;lp2<mainLetters.length;lp2++)
			{
				if(sWord.substring(lp1,lp1+1).equals(mainLetters[lp2])){returnWord=returnWord+sWord.charAt(lp1);}
				else{break;}
				System.out.println("here2");
			}
		}
		returnWord=pigLatin(returnWord);
		System.out.println("here3");
		sWord=sWord.substring(0,wordStartInt)+returnWord+sWord.substring(wordStartInt+returnWord.length(),sWord.length());
		System.out.println("here4");
		wordStartInt+=returnWord.length();
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
		return sWord + "ay";
	}
	else if(vowelPlace==0)
	{
		return sWord + "way";
	}
	else if(vowelPlace>=1)
	{
		if(sWord.charAt(1)=='u'&&sWord.charAt(0)=='q'){return sWord.substring(2,sWord.length())+"quay";}
		else{return sWord.substring(vowelPlace,sWord.length())+sWord.substring(0,vowelPlace)+"ay";}
	}
	else{return "ERROR";}
}