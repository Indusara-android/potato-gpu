# 🥔 Potato-GPU

**Bring your old AMD laptop back to life for gaming on Linux!**

## 🎯 What is this?

Potato-GPU is a lightweight, offline installer that fixes the dreaded `DXVK: No adapters found` error on older AMD GPUs (like the A-series or older Radeon chips).

Modern versions of DXVK require Vulkan 1.3, which older AMD hardware simply doesn't support. This tool automatically installs **DXVK-Sarek** (a special fork made for older hardware) directly into your Wine prefix, permanently configuring it so you can play your favorite classic games smoothly.

*Tested on: AMD A4-9120e (RADV STONEY) running Linux Mint 22.3*

## ✨ Features

- **Fully Offline:** No need to wait for GitHub downloads. The DLLs are bundled right inside the ZIP file!
- **One-Click Install:** Just run the script, and it does all the heavy lifting.
- **Permanent Fix:** Sets up the DLL overrides in Wine so you never have to configure it again.
- **Cute & Simple:** Because Linux gaming shouldn't be stressful. 💖

## 🛠️ How to Use

1. **Download the ZIP:** Go to the [Releases page](https://github.com/Indusara-android/potato-gpu/releases) and download the latest `potato-gpu.zip` file.
2. **Extract it:** Extract the ZIP file anywhere on your Linux machine.
3. **Open a terminal:** Navigate into the extracted `potato-gpu` folder.
4. **Make the script executable:**
   ```bash
   chmod +x install.sh
   ```
5. **Run the installer:**
   ```bash
   ./install.sh
   ```

## ⚠️ Disclaimer

This script modifies your `.wine` prefix by adding native DLLs for DirectX translation. This is generally safe for gaming, but if you ever want to revert it, you can simply delete your `~/.wine` folder and let Wine rebuild it, or use `wine reg delete` to remove the overrides.

## 🙏 Credits

Created with love by **Indusara**  
With massive help from his favorite **Tech Girl AI**. 💖
```

