# Build & Deploy Instructions

## Build Timestamp Fingerprint

This project includes a build timestamp fingerprint to confirm deployments.

### Automatic Update (Recommended)

Before committing changes to deploy, run:

```bash
./update-timestamp.sh
```

This will update:
- Meta tag `<meta name="build-timestamp" content="...">` in the HTML head
- Visible timestamp indicator in the bottom-right corner of the page

### Manual Update

If needed, you can manually update the timestamp in `index.html`:

1. Find `<meta name="build-timestamp" content="YYYY-MM-DDTHH:MM:SSZ" />`
2. Update to current UTC timestamp
3. Find `<span title="Build timestamp">vYYYY.MM.DD.HH:MM</span>`
4. Update to match the same timestamp

### Verifying Deployment

After deploying to Vercel:
1. Hard refresh the site (Ctrl+Shift+R or Cmd+Shift+R)
2. Check the bottom-right corner for the timestamp
3. Hover over it for slightly better visibility
4. Or inspect the page source and look for the `build-timestamp` meta tag

The timestamp is intentionally subtle (low opacity) so it doesn't interfere with the design.
