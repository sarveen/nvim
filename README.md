# 📝 Neovim Configuration

My personal neovim config which supports C, C++, Rust, Python and Golang

## 📌 Table of Contents
- [🚀 Installation](#-installation)
  - [Install Neovim](#install-neovim)
  - [Install Rust Nightly](#install-rust-nightly)
  - [Install Go Dependencies](#install-go-dependencies)
- [⌨️ Keybindings](#-keybindings)
  - [File Pickers](#file-pickers)
  - [LSP Pickers](#lsp-pickers)
  - [Diagnostics](#diagnostics)
  - [Git](#git)
  - [Debugging](#debugging)
  - [Testing](#testing)

---

## 🚀 Installation

### **Install Neovim**
To install Neovim via Homebrew:
```sh
brew install neovim
```

### **Install Rust Nightly (Required for Blink)**
Install Rust via `rustup`:
```sh
# via curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# via brew
brew install rustup
```
Switch to **Rust Nightly**:
```sh
rustup default nightly
```

### **Install Go Dependencies**
For **Go development**, install `golangci-lint`:
```sh
brew install golangci-lint
```

---

## ⌨️ Keybindings

### **File Pickers**
| Keybinding | Action |
|------------|--------|
| `<leader>ff` | Find Files |
| `<leader>fs` | Find LSP Symbols |
| `<leader>fr` | Find Recent Files |
| `<leader>fg` | Live Grep |
| `<leader>fp` | Find Projects |
| `<leader>e`  | Open File Explorer |

---

### **LSP Pickers**
| Keybinding | Action |
|------------|--------|
| `gd`  | Goto Definition |
| `gD`  | Goto Declaration |
| `gr`  | Goto References |
| `gi`  | Goto Implementations |

---

### **Diagnostics**
| Keybinding | Action |
|------------|--------|
| `<leader>od` | View Diagnostics |

---

### **Git**
| Keybinding | Action |
|------------|--------|
| `<leader>ol` | Open LazyGit |
| `<leader>gb` | Git Blame Current Line |
| `<leader>gB` | Open Repository in Browser |
| `<leader>gU` | Copy Repository URL |

#### **Gitsigns (Git Integration)**
| Keybinding | Action |
|------------|--------|
| `]h` | Next Hunk |
| `[h` | Prev Hunk |
| `<leader>hs` | Stage Hunk |
| `<leader>hr` | Reset Hunk |
| `<leader>hS` | Stage Buffer |
| `<leader>hR` | Reset Buffer |
| `<leader>hu` | Undo Stage Hunk |
| `<leader>hp` | Preview Hunk |
| `<leader>hb` | Blame Line |
| `<leader>hB` | Toggle Line Blame |
| `<leader>hd` | Diff This |
| `<leader>hD` | Diff This (~) |

---

### **Debugging**
| Keybinding | Action |
|------------|--------|
| `<leader>dc` | Start/Continue Debugging |
| `<leader>db` | Toggle Breakpoint |
| `<leader>ds` | Step Over |
| `<leader>di` | Step Into |
| `<leader>do` | Step Out |

---

### **Testing**
| Keybinding | Action |
|------------|--------|
| `<leader>tt` | Run Nearest Test |
| `<leader>tf` | Run All Tests in File |
| `<leader>ta` | Run All Tests |
| `<leader>to` | Open Test Output |
| `<leader>ts` | Toggle Test Summary |

---
