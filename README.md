#When the World Stopped Making Sense

A Dark Ages mod for CK2! 

Allows you to play from 476 (Fall of Western Roman Empire) to 1453 (Fall of Eastern Roman Empire).


### Developers & Testers

Because portraits DLC compatibility required to use sub-mods, it's no longer possible to clone directly Git repo inside mod folder.
To run the mod from a Git local repository:
- Clone the repository to Git default location (for instance C:\Users\username\git\)
 - If you already have a local Git repository inside the CKII mod folder, simply move the root WTWSMS folder (containing the .git folder) elsewhere, Git itself won't care that the folder has moved.
 - Alternatively, you can also delete the WTWSMS folder (**Warning**: make sure all your local work is commited & pushed to github, otherwise keep a backup copy !) and re-clone the repository from Github to another location
- Run create_symbolic_links.bat to create symbolic links from CK2 mod folder to the actual folders in your Git working directory
- Copy over all the .mod files from Git folder to CKII mod folder (you will need to re-copy them occasionally when they change in Git). 
