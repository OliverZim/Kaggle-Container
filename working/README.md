This folder contains the output files for your work. You should write to this directory with the path ```/kaggle/working``` because this is equivalent to the file access on the Kaggle platform.

You can also easily manage submissions of your output files via VS Code tasks.

```
// Example for submitting the file test.csv to the famous titanic competition

1. Ctrl+Shift+P -> Tasks: Run Task
2. Select kaggle: competition - submit solution
3. Insert the competition name and hit enter: titanic
4. Pick a file: test.csv
5. Everything else should execute automatically
6. You can view your score on the Kaggle website or locally by executing the task kaggle: competition - list submissions
```
