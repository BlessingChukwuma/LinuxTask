# Evidence Collection

No screenshots or terminal results are fabricated. Capture evidence from your own Kali lab.

## Explicitly required by the task
1. Command history (`.bash_history` or a copy-paste of commands used).
2. Screenshot or text file showing final output of `ls -laR /home/agent007/mission/`.
3. A 4–5 line explanation of `chmod`, `ls -l`, and `useradd`.

## Suggested supporting screenshots (the task does not mandate a count)
| Filename | Capture point | What it proves |
|---|---|---|
| `01-agent007-created.png` | After account verification | User, home, shell, sudo group |
| `02-agent007-login.png` | After `su - agent007` | Active user and home directory |
| `03-workspace-created.png` | After `mkdir` | Required directory tree |
| `04-files-and-listings.png` | After `touch` and redirected listings | Initial files and listing files |
| `05-copy-and-remove.png` | After `cp` and `rm keys.txt` | Backup copy and removed key file |
| `06-targets-permissions.png` | After `chmod 640` | Requested permissions via `ls -l` |
| `07-backup-recovery.png` | After restore | Backup file restored |
| `08-ownership-change.png` | After returning to agent007 | Changed owner observed |
| `09-final-recursive-listing.png` | At end | Final recursive listing |

## Terminal-output suggestions
Save genuine outputs in `terminal-output/`, e.g. `final-recursive-listing.txt`, `account-verification.txt`, `targets-permissions.txt`, and `ownership-verification.txt`.

Keep commands and relevant output readable. Do not show passwords, tokens, private keys, or unrelated personal information. Do not crop away details needed to prove the result. Suggested filenames are organizational aids, not extra task requirements.
