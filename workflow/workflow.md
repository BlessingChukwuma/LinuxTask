# Complete Practical Workflow

## Phase 1 — Create the user
**Account:** existing administrator with `sudo`.

```bash
sudo useradd -m -s /bin/bash -G sudo agent007
getent passwd agent007
id agent007
groups agent007
```
The first command creates `agent007`, makes the home directory, sets `/bin/bash`, and adds `sudo` group membership. Verify the home path, shell, and group. Suggested evidence: `01-agent007-created.png`. If the account already exists, stop and verify rather than recreating it blindly.

## Phase 2 — Set password and switch
**Account:** existing administrator, then `agent007`.

```bash
sudo passwd agent007
su - agent007
whoami
pwd
```
Set the password interactively; input is not displayed. `whoami` should show `agent007`; `pwd` should show `/home/agent007`. Suggested evidence: `02-agent007-login.png`. From here, do file operations as `agent007`.

## Phase 3 — Create workspace
**Account:** `agent007`.

```bash
cd /home/agent007
mkdir -p mission/intel mission/ops/backup
cd /home/agent007/mission
pwd
ls -laR /home/agent007/mission
```
`mkdir -p` creates parent directories as needed. Verify `intel/` and `ops/backup/`. Suggested evidence: `03-workspace-created.png`.

## Phase 4 — Create files and listing outputs
**Account:** `agent007`.

```bash
cd /home/agent007/mission/intel
touch targets.txt routes.txt keys.txt
ls -l
ls > listing1.txt
ls -l > listing2.txt
ls -la > listing3.txt
ls -la
cat listing1.txt
cat listing2.txt
cat listing3.txt
```
`touch` creates the three empty files. `>` redirects each listing to its required file; `ls -la` includes hidden entries. Verify all three listing files exist and contain output. Suggested evidence: `04-files-and-listings.png`.
Note: shell redirection creates each output file before `ls` runs, so the listing may include itself and any earlier listing files. This is normal.

## Phase 5 — Copy and remove
**Account:** `agent007`.

```bash
cp routes.txt /home/agent007/mission/ops/backup/
ls -l /home/agent007/mission/ops/backup/
rm keys.txt
ls -la /home/agent007/mission/intel/
```
Verify `backup/routes.txt` exists and `intel/keys.txt` is absent. `rm` removes the specified file; check the path first. Suggested evidence: `05-copy-and-remove.png`.

## Phase 6 — Set permissions
**Account:** `agent007`.

```bash
chmod 640 /home/agent007/mission/intel/targets.txt
ls -l /home/agent007/mission/intel/targets.txt
```
`640` means owner read/write, group read only, others no permissions. Before the later ownership change, expected permissions for a regular file are `-rw-r-----`. Suggested evidence: `06-targets-permissions.png`.

## Phase 7 — Simulate error and recover
**Account:** `agent007`.

```bash
rm /home/agent007/mission/ops/backup/routes.txt
ls -la /home/agent007/mission/ops/backup/
cp /home/agent007/mission/intel/routes.txt /home/agent007/mission/ops/backup/
ls -l /home/agent007/mission/intel/routes.txt
ls -l /home/agent007/mission/ops/backup/routes.txt
```
First verify the backup copy is absent, then restore it from `intel/` and verify both files exist. Suggested evidence: `07-backup-recovery.png`.

## Phase 8 — Change ownership as root
Start in the `agent007` shell.

```bash
sudo -i
whoami
chown root:root /home/agent007/mission/intel/targets.txt
ls -l /home/agent007/mission/intel/targets.txt
exit
whoami
ls -l /home/agent007/mission/intel/targets.txt
```
`sudo -i` opens a root login shell; confirm `whoami` says `root`. Run `chown` as root. `exit` returns to `agent007`; verify that identity and observe the owner with `ls -l`. The task gives `root` as an example owner. Do not change ownership back unless instructed. Suggested evidence: `08-ownership-change.png`.

## Phase 9 — Final evidence
**Account:** `agent007`.

```bash
ls -laR /home/agent007/mission/
```
Save the complete output in `submission/final-output.txt` on your host computer or capture a readable screenshot. This is the exact final-output command required by the task.

Optional convenience copy inside the lab:
```bash
history > /home/agent007/mission/intel/command-history.txt
```
The task accepts `.bash_history` or a copy-paste of commands used. Shell history is generally saved when the shell exits. Never submit passwords or secrets.

Complete the 4–5 line explanation in `submission/README.md`.

## Final expected file presence to verify
- `intel/`: `targets.txt`, `routes.txt`, `listing1.txt`, `listing2.txt`, `listing3.txt`.
- `intel/keys.txt` should have been removed.
- `ops/backup/routes.txt` should exist after restoration.
- `intel/targets.txt` should have mode `640`; if the example owner was used, its owner/group display should show `root`.
Record actual output; do not assume timestamps, sizes, or ownership.
