# Copilot Instructions for DCK$ Website

## Project Overview

This is the official website for DCK$ (Digital Currency Kid$) — a digital currency/token project combining street culture, graffiti, hip-hop, EDM, and crypto culture.

**Technology Stack:**
- Pure HTML5
- Tailwind CSS (loaded via CDN)
- No JavaScript framework dependencies
- Static site deployed to GitHub Pages

## Building and Testing

### Build Process
```bash
npm run build
```
This creates a `dist/` directory with all deployable assets.

### What the Build Does
- Creates the `dist/` directory
- Copies `index.html`, `logo.png`, `assets/`, `metadata/`, `CNAME`, and `vercel.json` to `dist/`
- Removes `.DS_Store` files

### Testing Locally
Since this is a static HTML site:
1. Open `index.html` directly in a browser, or
2. Use a local server: `python3 -m http.server 8000` or `npx serve . -p 8000`

### Deployment
The site automatically deploys to GitHub Pages on every push to `main` branch via GitHub Actions (`.github/workflows/deploy.yml`).

## Code Style and Conventions

### HTML
- Use semantic HTML5 elements
- Include proper accessibility attributes (ARIA labels, alt text, etc.)
- Follow existing indentation (2 spaces)
- Keep meta tags organized in the `<head>`

### CSS/Tailwind
- Use Tailwind utility classes for styling
- Custom CSS goes in the `<style>` tag in `<head>`
- Avoid inline styles; use Tailwind utilities instead
- Maintain the existing fallback CSS for when Tailwind CDN is blocked

### File Organization
- `index.html` — Main landing page
- `assets/` — Images, videos, and brand assets
  - `assets/krew/` — Team member avatars
  - `assets/brand/` — Logo and branding assets
  - `assets/video/` — Video assets
- `metadata/` — Token metadata files
- `logo.png` — Main logo file
- `CNAME` — Custom domain configuration
- `scripts/` — Build and deployment scripts

## Important Constraints

1. **No Build Dependencies**: Keep the project simple with no complex build tools or frameworks
2. **CDN-Based Styling**: Tailwind CSS is loaded from CDN; include fallback CSS for offline/blocked scenarios
3. **Static Content Only**: No server-side processing; all content is static HTML
4. **Accessibility First**: Maintain accessibility standards with proper ARIA labels and semantic HTML
5. **Mobile-First**: Ensure responsive design using Tailwind's responsive utilities
6. **Fast Loading**: Keep assets optimized; the site should load quickly

## Common Tasks

### Adding New Content Section
1. Add semantic HTML structure following existing patterns
2. Use Tailwind utility classes for styling
3. Ensure mobile responsiveness with `sm:`, `md:`, `lg:` breakpoints
4. Add appropriate ARIA labels for accessibility

### Updating Team Members ("The Krew")
1. Add avatar images to `assets/krew/`
2. Update the corresponding section in `index.html`
3. Follow the existing card layout pattern

### Modifying Styles
1. Use Tailwind utility classes when possible
2. For custom styles not available in Tailwind, add to the `<style>` tag
3. Update the fallback CSS if you add critical new styles

### Image Assets
- Optimize images before adding them (use WebP when possible)
- Keep image file sizes reasonable (aim for <500KB for photos, <100KB for icons/logos)
- Place in appropriate subdirectory under `assets/`
- Use descriptive filenames
- Always include alt text for accessibility

## Testing Checklist

Before submitting changes:
- [ ] Run `npm run build` successfully
- [ ] Open `index.html` in a browser to verify visual changes
- [ ] Test on mobile viewport (use browser dev tools)
- [ ] Verify all images load correctly
- [ ] Check that external links work
- [ ] Validate HTML (optional but recommended)
- [ ] Ensure accessibility with screen reader or browser tools

## Best Practices

1. **Minimal Changes**: Make surgical, focused changes to accomplish the task
2. **Preserve Working Code**: Don't modify unrelated working code
3. **Test Incrementally**: Build and verify changes frequently
4. **Document Decisions**: Add comments for complex logic or workarounds
5. **Accessibility**: Always consider screen readers and keyboard navigation
6. **Performance**: Keep the site fast and lightweight
