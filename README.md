# Teacher preparation for Big Data course

### Customise the content for you class

1. Clone this repository `git clone ssh://git@gitlab.adaltas.com:10022/academy/courses.git`.
2. `cd ./courses && git checkout bigdata-course-parameterised`
3. Move to the bigdata course dir and turn it into a git repo `cd ./courses/bigdata && git init`
4. Update the variable assignments in the `./scripts/replace-placeholders.sh` then run the script.
5. Create a commit with the contents of the class customised bigdata course with `git add -A && git commit -m "initial commit"`.
6. Create a repository for your class in the Adaltas github organisation using the naming convention `school-course-year-season` e.g. *dsti-bigdata-2022-spring*.
7. Gitlab uses 'master' branch while github uses 'main' branch by default. Ensure your local branch matches the name of the target branch with `git branch -m master main` (the push may fail if not done).
8. Add your newly created github remote `git remote add <preferred-origin-name> <github-repo-url>`.
9. Push the customised local repo to github with `git push <github-origin> <target-branch>`
10. Ensure that the `drivers.csv` dataset is available at the `/education/dsti-bigdata-2022-spring/resources/lab4/nyc_drivers/drivers.csv` on hdfs.

  ```
  # Copy the drivers.csv file to the edge
  scp ./modules/04.data-warehousing-with-hive/lab-resources/code/drivers.csv dharty@edge-1.au.adaltas.cloud:/home/dharty
  # From the edge, put drivers.csv in the right place
  hdfs dfs -mkdir -p /education/dsti_2022_spring/resources/lab4/nyc_drivers
  hdfs dfs -copyFromLocal /home/dharty/drivers.csv /education/dsti_2022_spring/resources/lab4/nyc_drivers
  ```
11. Ensure that the hive database named after the group exists
```
# From the edge
# beeline (make sure only underscores in groupname)
> create database if not exists dsti_2022_spring
```

Additional notes:
- If students misplace their password of usernames, teachers can manage the students via the Adaltas ldap at `https://ipa1.au.adaltas.cloud/ipa/ui/`
- In case the users haven't received their email, check that the user exists in the ipa ui, and the ovpn file can be downloaded from the vpn server assuming it has been created:

```
# connect to the vpn
ssh -i /path/to/nikita.key nikita@vpn-1.au.adaltas.cloud
sudo su
cd /root/openvpn-clients/configs/
# all .ovpn files at this path
```
Make sure that an ebook is available for wordcount operation
```
wget https://www.gutenberg.org/files/2701/2701-0.txt -O /home/dharty/moby-dick.txt
hdfs dfs -mkdir /education/dsti_2022_spring/resources/lab2 && hdfs dfs -copyFromLocal /home/dharty/moby-dick.txt /education/dsti_2022_spring/resources/lab2
```

Student preparation:
- All students should consider following an introduction to the linux terminal (for example this one [here](https://ubuntu.com/tutorials/command-line-for-beginners#1-overview)) because some of the labs will take place on a remote linux server
- We would ask that students using Windows consider installing [putty](https://www.putty.org/) on their machine ( a small application to help windows machines ssh to remote linux machines). They should also install [Git for windows](https://gitforwindows.org/).
- Mac users should verify whether or not they have git already installed on their machine and install it before class if not. Git is a small application but in some cases requires the full download of the xcode IDE on Mac which may take some time. The software [TunnelBlick](https://tunnelblick.net/downloads.html) may also simplify connecting to a VPN server on Mac.
- Other linux based operating systems have nothing to install in advance.

# TODO

Use git filters to hide-answers (https://stackoverflow.com/questions/16244969/how-to-tell-git-to-ignore-individual-lines-i-e-gitignore-for-specific-lines-of)

