# How to check for an ssh key and upload it to github

### 1. Check if an SSH Key Exists on Your Windows Machine Using PowerShell
- Open PowerShell.
- Navigate to the .ssh directory:

```powershell
Set-Location -Path $HOME\.ssh
```

- List the files in the directory:

```powershell
Get-ChildItem
```

- Look for files named id_rsa.pub, id_ecdsa.pub, or id_ed25519.pub. If any of these files exist, you have an SSH key.

### 2. Generate an Ed25519 SSH Key
- Generate the SSH key:

```powershell
ssh-keygen -t ed25519 -C "your_email@example.com"
```

- Follow the prompts to save the key in the default location and set a passphrase (optional).

### 3. Upload the Public Key to GitHub

- Copy the public key to the clipboard:

```powershell
Get-Content -Path $HOME\.ssh\id_ed25519.pub | Set-Clipboard
```

- Go to GitHub and log in.
- Navigate to Settings > SSH and GPG keys > New SSH key.
- Paste the public key into the "Key" field and give it a title.
- Select "Authentication" as the key type.
- Click Add SSH key.

### 4. Test if the SSH Key Works
- Test the SSH key by running the following command in PowerShell:

```powershell
ssh -T git@github.com
```

- You should see a message like:

```
"Hi username! You've successfully authenticated, but GitHub does not provide shell access."
```