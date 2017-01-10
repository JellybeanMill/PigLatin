import java.util.*;

public void setup() {
	String lines[] = loadStrings("LowellHymn.txt");
	System.out.println("there are " + lines.length + " lines");
	for(int lp1=0;lp1<lines.length;lp1++)
	{
		int wordCount = 1;
		for(int lp2=0;lp2<lines[lp1].length();lp2++)
		{
			if(line[lp1].charAt(lp2)==' '){wordCount++;}
		}
		String [] words = new String(wordCount);
		
		for (int i = 0 ; i < lines.length; i++)
		{
			System.out.println(pigLatin(lines[i]));
		}
	}
}
public void draw()
{
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