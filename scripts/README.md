# Scripts Directory

This directory contains utility scripts for the DCK$ website project.

## Available Scripts

### test-build.sh
Build validation test script that ensures the build process works correctly.

**Usage:**
```bash
npm test
```

**What it does:**
- Cleans up any existing `dist/` directory
- Runs `npm run build`
- Validates that all required files and directories are created:
  - `dist/index.html`
  - `dist/logo.png`
  - `dist/CNAME`
  - `dist/vercel.json`
  - `dist/assets/`
  - `dist/metadata/`
- Ensures `index.html` is not empty
- Verifies no `.DS_Store` files exist in the build output

### vercel_sanity.sh
Vercel deployment sanity check script.