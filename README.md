# 🚀 My Dotfiles

This repository contains my personal **dotfiles** for configuring my development environment. It includes configurations for tools like **WezTerm, Neovim, PowerShell, Starship, and more**. These dotfiles are managed using **symbolic links**, allowing for easy synchronization across multiple machines.

## 📂 Structure

- **setup_symlinks.ps1** → Creates symlinks for all dotfiles
- **update_dotfiles.ps1** → Commits and pushes updated dotfiles to GitHub
- **.gitconfig** → Git configuration
- **Microsoft.PowerShell_profile.ps1** → PowerShell customizations
- **nvim/** → Neovim configuration
- **wezterm/** → WezTerm configuration
- **starship.toml** → Starship prompt settings
- **settings.json** → Windows Terminal settings
- **startup-script.bat** → Startup script for Windows

---

## 🔧 Installation

### **1️⃣ Clone the Repository**

```powershell
git clone https://github.com/nxstynate/dotfiles.git $HOME\dotfiles
cd $HOME\dotfiles
```

### **2️⃣ Run the Setup Script**

This will create symbolic links from your home directory to the stored dotfiles.

```powershell
.\setup_symlinks.ps1
```

### **3️⃣ Done! 🎉**

Your environment is now configured with the correct settings.

---

## 🔄 Updating Dotfiles

After modifying any configuration file, **commit and push** your changes:

```powershell
.\update_dotfiles.ps1
```

To **sync changes on another machine**, simply run:

```powershell
git pull origin main
.\setup_symlinks.ps1
```

---

## 💻 Setting Up a New Machine

For a fresh install, run:

```powershell
git clone https://github.com/nxstynate/dotfiles.git $HOME\dotfiles
cd $HOME\dotfiles
.\setup_symlinks.ps1
```

For additional software installation, you can use **Windows Package Manager (winget)**:

```powershell
winget install Starship WezTerm Neovim.Git PowerShell
```

---

## ❗ Troubleshooting

### **💡 Symlink Issues**

If symbolic links fail to create, make sure you **run PowerShell as Administrator**.

### **💡 GitHub Authentication Issues**

If you're getting errors when pushing to GitHub:

```powershell
git remote set-url origin https://nxstynate@github.com/nxstynate/dotfiles.git
```

Or use **SSH authentication** instead:

```powershell
git remote set-url origin git@github.com:nxstynate/dotfiles.git
```

---

## 🚀 Future Improvements

- [ ] Automate new machine setup with an `install.ps1` script
- [ ] Add additional configurations for tools like Tmux, Zsh, and VS Code
- [ ] Explore automated syncing with Windows Task Scheduler

---

## 📜 License

Feel free to use and modify these dotfiles to suit your needs. Happy coding! 🎨✨
