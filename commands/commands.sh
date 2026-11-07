#!/usr/bin/env bash
# MANUAL COMMAND REFERENCE — DO NOT RUN THIS WHOLE FILE AS ONE SCRIPT.
# Follow the account labels and workflow/workflow.md.

# PHASE 1 — existing sudo-capable administrator
sudo useradd -m -s /bin/bash -G sudo agent007
getent passwd agent007
id agent007
groups agent007
sudo passwd agent007

# PHASE 2 — switch to agent007; enter its password when prompted
su - agent007
whoami
pwd

# PHASE 3 — workspace (agent007)
cd /home/agent007
mkdir -p mission/intel mission/ops/backup
cd /home/agent007/mission
ls -laR /home/agent007/mission

# PHASE 4 — files and listings (agent007)
cd /home/agent007/mission/intel
touch targets.txt routes.txt keys.txt
ls > listing1.txt
ls -l > listing2.txt
ls -la > listing3.txt
ls -la
cat listing1.txt
cat listing2.txt
cat listing3.txt

# PHASE 5 — copy and remove (agent007)
cp routes.txt /home/agent007/mission/ops/backup/
ls -l /home/agent007/mission/ops/backup/
rm keys.txt
ls -la /home/agent007/mission/intel/

# PHASE 6 — requested permissions (agent007)
chmod 640 /home/agent007/mission/intel/targets.txt
ls -l /home/agent007/mission/intel/targets.txt

# PHASE 7 — remove backup copy, then restore (agent007)
rm /home/agent007/mission/ops/backup/routes.txt
ls -la /home/agent007/mission/ops/backup/
cp /home/agent007/mission/intel/routes.txt /home/agent007/mission/ops/backup/
ls -l /home/agent007/mission/intel/routes.txt
ls -l /home/agent007/mission/ops/backup/routes.txt

# PHASE 8 — explicit ownership exception: root only for chown
# Start this block from the agent007 shell.
sudo -i
whoami
chown root:root /home/agent007/mission/intel/targets.txt
ls -l /home/agent007/mission/intel/targets.txt
exit
# Back as agent007:
whoami
ls -l /home/agent007/mission/intel/targets.txt

# PHASE 9 — final evidence (agent007)
ls -laR /home/agent007/mission/
# Optional copy of current shell history; never include secrets:
history > /home/agent007/mission/intel/command-history.txt
