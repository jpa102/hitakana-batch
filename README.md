# introduction
this is hitakana, a silly *batch script* i made for fun that **outputs** japanese kana (hiragana & katakana) in utf-8 hex that's formatted to be pasted into any web browser (address bar)

## building
go to **src/$real_src** and run makefiles.cmd

this will combine all the text files into batch scripts *(where main.cmd is the main batch script)*

**optional:** you can run build.cmd to create an exe installer based on iexpress *(there are some bugs though, namely the "missing" command.com file)*

## usage
type %output% %your_input%

where **"%output%"** is just a remapped echo command with some tweaks and **"%your_input%"** is the type of kana (%h_ri% will output %e3%82%8a / 0xe3828a)

*h_* is for **hiragana** and *k_* is for **katakana**

one **good example** is *%output% %h_a%%h_ri%%h_ga%%h_to%%h_u%* which will print out **"%e3%81%82%e3%82%8a%e3%81%8c%e3%81%a8%e3%81%86"** (ありがとう)

# etc / miscellaneous

## but but, i don't want to type out "h_" and "k_" every single time!!!

that's a good one, there's sub builds of hitakana where it focuses on only one kana so you don't have to make your fingers tired like it ran a marathon

## what about other platforms?

i'm thinking about that too. but i have an experimental javascript and json versions of this batch script, at least for now

## why is it named like that?
i combined (hi)ragana and ka(takana) into "one" word, that's why it's spelled that way
