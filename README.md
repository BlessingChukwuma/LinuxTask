# Secure File Management & User Configuration on Kali Linux

GitHub-ready workflow for the uploaded practical task. This is a template for performing and documenting the lab; it contains no fabricated results or screenshots.

## Objective
Demonstrate Linux user management and file-system commands by creating `agent007`, setting up `/home/agent007/mission/`, managing files, applying permissions, recovering a deleted backup, and observing an ownership change.

## Exact task requirements
1. Create `agent007` with a home directory, `/bin/bash`, and membership in `sudo`:
   `sudo useradd -m -s /bin/bash -G sudo agent007`
2. Set the password and switch to `agent007`.
3. Create `/home/agent007/mission/intel/` and `/home/agent007/mission/ops/backup/` using `mkdir` and `cd`.
4. In `intel/`, create empty `targets.txt`, `routes.txt`, `keys.txt`. Run `ls`, `ls -l`, `ls -la`, redirecting outputs to `listing1.txt`, `listing2.txt`, `listing3.txt`.
5. Copy `routes.txt` to `backup/`; remove `keys.txt` from `intel/` using `rm`.
6. Set `targets.txt` to owner read/write, group read only, others no permissions; use `chmod` and verify with `ls -l`.
7. Remove `ops/backup/routes.txt`, then copy `routes.txt` from `intel/` back into `backup/`.
8. As root, change ownership of `intel/targets.txt` to another user (the task gives `root` as an example); switch back to `agent007` and inspect using `ls -l`.

## Privilege rule
Do not use root for file operations. Perform the activity as `agent007`, except the explicit ownership change in step 8. The supplied `useradd -G sudo` command already adds the user to `sudo`; do not add an unnecessary `usermod` step.

## Tools and prerequisites
Kali Linux terminal and an existing administrator account able to run `sudo`. Commands used: `useradd`, `passwd`, `su`, `mkdir`, `cd`, `touch`, `ls`, `cp`, `rm`, `chmod`, `chown`, `history`, `whoami`, `pwd`, `id`, `groups`, `getent`.

## Required workspace
```text
/home/agent007/mission/
├── intel/
└── ops/
    └── backup/
```

## Repository structure
```text
kali-secure-file-management-user-configuration/
├── README.md
├── .gitignore
├── docs/                 # task summary and scope
├── workflow/             # detailed manual procedure
├── commands/             # annotated command reference
├── evidence/
│   ├── screenshots/
│   └── terminal-output/
└── submission/           # command-history and final-output templates
```

## Key permission command
`chmod 640 /home/agent007/mission/intel/targets.txt`

`640` means owner `rw-`, group `r--`, others `---`; expected long permission string for a regular file is `-rw-r-----` before the ownership exercise.

## Evidence and submission
The task explicitly requires:
- `.bash_history` or a copy-paste of commands used.
- Screenshot or text file showing final `ls -laR /home/agent007/mission/` output.
- A 4–5 line explanation of `chmod`, `ls -l`, and `useradd`.

See `evidence/README.md` and `submission/README.md`. Capture genuine output from your own lab. Do not expose passwords or secrets.

## Final verification checklist
- [ ] `agent007` exists, has a home directory, `/bin/bash`, and `sudo` membership.
- [ ] Password set; file operations performed as `agent007` except explicit root `chown`.
- [ ] Required directory structure created.
- [ ] Three empty files initially created in `intel/`.
- [ ] Three `ls` outputs saved to the required listing files.
- [ ] `routes.txt` copied to backup; `keys.txt` removed.
- [ ] `targets.txt` set to mode `640` and verified.
- [ ] Backup copy deleted and restored.
- [ ] Ownership changed as root; returned to `agent007` and inspected.
- [ ] Command history, final recursive listing, and 4–5 line explanation prepared.

## Troubleshooting
- If `agent007` already exists, verify with `id agent007` and `getent passwd agent007`; do not recreate/delete blindly.
- If `su - agent007` fails, confirm the account and password. Password characters do not display while typing.
- If `sudo` fails, check `groups agent007` from an administrator account and start a fresh login session.
- If file operations give permission errors, check `whoami` and directory ownership; do not perform all operations as root.
- Shell redirection creates a listing file before `ls` runs, so a listing may include itself or earlier listing files. This is normal.
- `rm` removes the specified file; verify the path before running it.

Safety: use your own Kali system or authorized lab. Do not run file operations as root except the task's ownership step.
