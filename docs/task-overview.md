# Task Overview — Secure File Management & User Configuration on Kali Linux

## Objective
Demonstrate fundamental Linux file-system and user-management commands by setting up a secure workspace for a newly created user and organizing files with proper permissions and structure.

## Account requirements
- Username: `agent007`
- Create home directory; shell `/bin/bash`; supplementary group `sudo`.
- Required command: `sudo useradd -m -s /bin/bash -G sudo agent007`
- Set password and switch to `agent007`.
- Do file operations as `agent007`, except step 8's explicit root ownership change.

## Required steps
1. Create the user as above.
2. Set password and switch to the user.
3. Create `mission/intel` and `mission/ops/backup` under `/home/agent007/`, using `mkdir` and `cd`.
4. Create empty `targets.txt`, `routes.txt`, `keys.txt` in `intel/`; redirect `ls`, `ls -l`, `ls -la` output to `listing1.txt`, `listing2.txt`, `listing3.txt`.
5. Copy `routes.txt` to `backup/`; remove `keys.txt` from `intel/` with `rm`.
6. `chmod` `targets.txt` so owner is read/write, group read only, others no access; verify with `ls -l`.
7. Remove `ops/backup/routes.txt`, then restore it by copying from `intel/`.
8. As root, change ownership of `intel/targets.txt` to another user (example: `root`); switch back to `agent007` and observe with `ls -l`.

## Required path/file sequence
```text
/home/agent007/mission/
├── intel/
│   ├── targets.txt
│   ├── routes.txt
│   ├── keys.txt       # created first, then removed
│   ├── listing1.txt
│   ├── listing2.txt
│   └── listing3.txt
└── ops/
    └── backup/
        └── routes.txt # copied, removed, then restored
```
This describes intended operations, not completed results.

## Submission
- Command history (`.bash_history` or copy-paste of commands used).
- Screenshot or text file showing final `ls -laR /home/agent007/mission/` output.
- Text explanation (4–5 lines) of `chmod`, `ls -l`, and `useradd`.

## Not specified
The task does not specify a screenshot count, password, second username for the ownership example, GitHub URL, branch name, or report format. Suggested evidence filenames in this repository are organizational aids, not extra requirements.
