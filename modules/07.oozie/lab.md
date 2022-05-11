# Big Data Ecosystem

## Lab 6: Oozie

### Goals

Chain the Hive actions done in [lab4](../lab4) using Oozie.

### Ressources

The Oozie workflow is composed of:

- The `workflow.base.xml` that contains all the actions to be run (you will have to complete this file)
- The `job.properties` file that contains the job properties, you will have to modify some of them
- The `scripts` folder that will contain our Hive scripts

### Useful links

- [Oozie documentation](https://oozie.apache.org/docs/4.3.1/)
- [Oozie Hive2 Action](https://oozie.apache.org/docs/4.3.1/DG_Hive2ActionExtension.html)

### How to run a workflow

1. If not already done, `git clone` this repo to your home directory
   ```bash
   git clone https://github.com/adaltas/dsti-bigdata-2022-spring.git
   ```
2. Pull the latest changes
   ```bash
   cd dsti-bigdata-2022-spring
   git pull
   ```
3. Copy the `oozie_wf` folder to your home directory

   ```bash
   cd
   cp -r dsti-bigdata-2022-spring/modules/07.oozie/lab-resources/oozie_wf .
   ```

4. Edit the `oozie_wf/job.properties` file using `vim` to change the `hiveUsername` and `cluserUsername`
   In `vim`, press `i` to enter edit mode, `esc` to exit the edit mode and `:wq` to save and quit the editing
   ```ini
   # Variables
   hiveUsername=f_lastname
   clusterUsername=f.lastname-dsti
   ```
5. Put the workflow folder in HDFS (in your user directory for example)
   ```bash
   hdfs dfs -put -f oozie_wf/ "/user/$USER"
   ```
6. Submit the job using the `oozie` CLI
   ```bash
   oozie job -run -config oozie_wf/job.properties -oozie http://oozie-1.au.adaltas.cloud:11000/oozie
   ```
7. To get the status of the job from the CLI

   ```bash
   oozie job -info 0000040-201011090406050-oozie-oozi-W -oozie http://oozie-1.au.adaltas.cloud:11000/oozie
   ```

8. To get the logs of one action from the `yarn` CLI
   1. Get the job ID from the oozie command of step 3. (e.g. `job_1631812995637_0402`)
   2. Replace `job` by `application` (e.g. `application_1631812995637_0402`)
   3. Use `yarn logs` to get the logs from `stderr`:
      ```sh
      yarn logs -applicationId application_1631812995637_0402 -log_files 'stderr'
      Container: container_e54_1631812995637_0402_01_000002 on wrk-1.au.adaltas.cloud_45454_1634646632767
      LogAggregationType: AGGREGATED
      ===================================================================================================
      LogType:stderr
      LogLastModifiedTime:Tue Oct 19 12:30:32 +0000 2021
      LogLength:3279
      LogContents:
      SLF4J: Class path contains multiple SLF4J bindings.
      ...
      ```

### TO DO

1. Complete the `workflow.base.xml` to be able to run it (2 parameters to add: `jdbc-url`, `script`)
2. Adapt the `job.properties` to your workflow
3. Run the job
4. Make sure there are no errors
5. Add actions to the workflow:
   1. Create the ORC drivers table
   2. Insert data from the CSV table to the ORC table
