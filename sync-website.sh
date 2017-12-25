#!/bin/bash
# Keeps the remote and local copies of my website in sync, moving information each way, as appropriate.

# First, transfer back any files for which the remote copy is the master copy (which is not the case for most of the non-blog site)
# Currently, this means downloading the stats for the Trump and Palin quizzes.
rsync -av -L --progress --delete --copy-links --copy-unsafe-links --log-file-format="" --log-file="/home/patrick/Desktop/nfs.log" patrickbrianmooney_patrickbrianmooney@ssh.phx.nearlyfreespeech.net:/home/public/~patrick/projects/sarah-palin/stats /~patrick/projects/sarah-palin/
rsync -av -L --progress --delete --copy-links --copy-unsafe-links --log-file-format="" --log-file="/home/patrick/Desktop/nfs.log" patrickbrianmooney_patrickbrianmooney@ssh.phx.nearlyfreespeech.net:/home/public/~patrick/projects/TrumpQuiz/stats /~patrick/projects/TrumpQuiz/

# Upload primary content, excluding graphics and other large files, which tend to be hosted elsewhere, and excluding the kinds of leftover garbage that sometimes get generated as side effects of the content-editing process; don't copy back things that were first downloaded, since they might have changed in the meanwhile. 
rsync -av -L --progress --delete --copy-links --copy-unsafe-links --log-file-format="" --log-file="/home/patrick/Desktop/nfs.log" --exclude "*jpg" --exclude "*png" --exclude "*pdf" --exclude "*odt" --exclude "*doc" --exclude "*docx" --exclude "*ppt" --exclude "*pptx" --exclude "*goutpu*" --exclude "*old" --exclude "*mbox" --exclude "*~" --exclude ".thumbnails" --exclude "blogs/" --exclude "sarah-palin/stats" --exclude "TrumpQuiz/stats" --exclude "*orig" --exclude "*rej" --exclude "*pycache*" --exclude "*pyc" --exclude ".idea/" --exclude ".git/" --exclude ".gitignore/" --exclude ".git" --exclude ".idea" /website-root/* patrickbrianmooney_patrickbrianmooney@ssh.phx.nearlyfreespeech.net:/home/public/


# Deal with blog content.
# For NorCheeringCrowds, the remote copy IS the master copy; download it; keep it in sync with --delete
rsync -av --progress --delete --log-file-format="" --log-file="/home/patrick/Desktop/nfs.log" patrickbrianmooney_patrickbrianmooney@ssh.phx.nearlyfreespeech.net:/home/public/~patrick/blogs/NorCheeringCrowds/ /~patrick/blogs/NorCheeringCrowds/
# For XPB, the local copy is the master copy. Keep the remote copy strictly in sync with --delete, since the structure may change as I play with the Jekyll blog
rsync -av --progress --delete --log-file-format="" --log-file="/home/patrick/Desktop/nfs.log" /~patrick/blogs/XPB/ patrickbrianmooney_patrickbrianmooney@ssh.phx.nearlyfreespeech.net:/home/public/~patrick/blogs/XPB/

find /website-root/ -iname "*~" -print0 | xargs -0 $(which rm)
chmod -R a+r /website-root

