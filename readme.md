# DrvLoader-Fork (A Fork of DrvLoader)

This fork aims to fix pdb extraction

Original project link: https://github.com/wesmar/KernelResearchKit

**DrvLoader** is a universal Driver Signature Enforcement (DSE) bypass and driver loading utility for Windows. 


## Usage

You can run `drvloader.exe` without any arguments to enter the interactive console menu, or use the Command Line Interface for scripting and automation.

```cmd
Usage: drvloader [command] [options]

Commands:
  (no args)              Interactive mode
  bypass                 Disable DSE (Leaves it disabled)
  restore                Enable DSE (Restores original callback)
  status                 Check current DSE status
  load <path>            Load an unsigned driver (Stop -> Patch DSE -> Start -> Restore DSE)
  load <path> -s <0-4>   Load with specific Service StartType
  reload <driver>        Reload an active driver
  remove <driver>        Stop and delete the driver service
  stop <driver>          Stop the driver service (without deleting it)
  history                Show the driver loading history
  offsets                Dump the resolved kernel offsets for external tools
```

## Disclaimer

This tool is strictly for **educational and research purposes**. Using vulnerable drivers to modify kernel memory can lead to system instability (BSODs) and poses security risks. It can also trigger bans in multiplayer games equipped with kernel-level Anti-Cheats. Use at your own risk.
