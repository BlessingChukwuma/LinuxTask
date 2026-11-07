# Submission Instructions

The uploaded task requires three items.

## 1. Command history
Submit `.bash_history` or a copy-paste of commands used. Paste the actual history into `command-history.txt`. Do not include passwords or secrets. Interactive shell history is generally written when the shell exits.

## 2. Final recursive listing
Submit a screenshot or text file showing the actual output of:
```bash
ls -laR /home/agent007/mission/
```
Paste the complete output into `final-output.txt`, or provide a readable screenshot separately. Do not invent permissions, owners, sizes, or timestamps.

## 3. 4–5 line explanation
Explain what `chmod`, `ls -l`, and `useradd` do. Starter wording (edit into your own understanding):
1. `useradd` creates a new user account in Linux.
2. In this task, its options create the home directory, set `/bin/bash` as the login shell, and add the account to the `sudo` group.
3. `chmod` changes the permission settings of a file or directory.
4. `ls -l` displays a long listing with permissions, ownership, size, and modification information.
5. `chmod 640` gives the owner read/write access, the group read access, and others no access.

Keep your final explanation to 4–5 lines as required.

## Before submission
- [ ] Command history included.
- [ ] Final recursive listing screenshot or text output included.
- [ ] 4–5 line explanation included.
- [ ] Evidence is genuine and readable.
- [ ] No passwords or secrets exposed.
