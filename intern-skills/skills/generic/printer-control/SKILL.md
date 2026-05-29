---
name: printer-control
description: >
  Discovers and controls network printers — print files, check ink/toner levels, manage print queue,
  scan documents, and configure printer settings. Use when the user asks to print, scan, check printer
  status, or manage print jobs. Requires printer info from onboarding.json discovered_devices.
---

# Printer Control

## Quick Start
Read `{baseDir}/onboarding.json` → `discovered_devices.printers` to get saved printer list. If empty, run a quick network scan to find printers. Use IPP/CUPS commands for printing and queue management.

## Workflow
1. Load printer list from `onboarding.json` → `discovered_devices.printers`
2. If no printers saved or user says "scan printers" → run discovery:
   - `dns-sd -B _ipp._tcp local` (Bonjour/mDNS) or `lpstat -p -d` (CUPS) or `avahi-browse -t _ipp._tcp` (Linux)
   - Parse results: name, IP, model, capabilities (color, duplex, scan)
3. Identify the target printer (if multiple, ask user to pick)
4. Execute the requested operation (print, scan, status, queue)
5. Report result with clear status

## Examples

**Example 1: Print a Document**
Input: "Print the quarterly report PDF"
Output:
```
🖨️ Printing: quarterly-report.pdf

Printer: HP LaserJet Pro M404 (192.168.1.50)
Pages: 12
Color: Black & White
Duplex: Yes (double-sided)
Status: ✅ Sent to print queue (Job #347)

Estimated completion: ~2 minutes
```

**Example 2: Check Printer Status**
Input: "How's the printer doing?"
Output:
```
🖨️ Printer Status

| Printer | IP | Status | Toner/Ink | Queue |
|---|---|---|---|---|
| HP LaserJet Pro M404 | 192.168.1.50 | ✅ Ready | Black: 45% | 0 jobs |
| Canon PIXMA G6020 | 192.168.1.52 | ✅ Ready | C:80% M:65% Y:70% K:90% | 2 jobs |

All printers online and operational.
```

**Example 3: Scan a Document**
Input: "Scan a document from the HP printer"
Output:
```
📄 Scanning from HP LaserJet Pro M404

Format: PDF
Resolution: 300 DPI
Color: Auto-detect

Status: ✅ Scan complete
Saved to: ~/Documents/Scans/scan-2026-03-23-143022.pdf
```

## Tools
- Use `Bash` to execute CUPS commands (`lp`, `lpstat`, `lpq`, `lprm`, `cancel`)
- Use `Bash` with `dns-sd` or `avahi-browse` for printer discovery
- Use `Bash` with `ipp` or `curl` for IPP protocol operations (status, ink levels)
- Use `Read` to load `onboarding.json` for saved printer config
- Use `Write` to update `onboarding.json` when new printers are added

## Error Handling
- If no printers found → suggest checking WiFi connection, run manual scan
- If printer offline → report last-seen status, suggest checking power/network
- If print job fails → show error details, suggest retry or alternative printer
- If scan not supported → inform user, suggest alternative printer with scan capability
- If permission denied → guide user to add printer via System Preferences / CUPS admin

## Rules
- Always confirm before printing large jobs (>20 pages) or color prints
- Default to double-sided (duplex) printing when available
- Show estimated page count before printing
- Never expose printer admin passwords in output
- Use saved printer list from onboarding.json as primary source
- If user adds a new printer, update onboarding.json discovered_devices

## Output Template
```
🖨️ [Action]: [Document/Status]

Printer: [name] ([IP])
[Action-specific details]

Status: [Success / Failed / Queued]
[Additional context if needed]
```
