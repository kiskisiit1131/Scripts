# Scripts

The only way I'll ever practice the scripting I learned in school is if I have a use case for it. This repository is to store all of these use cases.

For now, I just have one so I will list it here. I'm sure as this repository grows over time, there will be some restructuring.

## Hash Comparer - PowerShell

Oftentimes when downloading files or programs off of the Internet, the owners/creators/developers will leave the hash of the file to ensure integrity.

I found it tedious to have to compare this manually, so I wrote a script for it to make the comparison easier. When you run the script, a file dialog box will open for you to pick the file you're checking. Then, you can select what type of hash you want to compare it to and paste in what the hash was on the website you downloaded the file from. The script will compare the two and inform you if the hashes are the same or not. You can run this multiple times on the same file with different hash types.

### Screenshots:

*Test File*

<img src="screenshots/website_hash.png" alt="sample hash"/>

*Valid hash comparison*

<img src="screenshots/example.png" alt="good match"/>

*Invalid hash comparison*

<img src="screenshots/no_match.png" alt="bad match"/>
