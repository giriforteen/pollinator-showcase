# GENERATING IMAGE ASSETS
## From HTML to PNG/JPG

The poster and Instagram visuals are currently HTML files with animations. To share on platforms that require image files, you'll need to convert them to PNG or JPG.

---

## METHOD 1: Browser Screenshot (Easiest)

### For Poster (1200x1600)
```bash
1. Open: /mnt/user-data/outputs/Pollinator_Poster.html
2. Browser window: Set to 1200px wide
3. Chrome DevTools: Cmd/Ctrl + Shift + I
4. Device toolbar: Cmd/Ctrl + Shift + M
5. Set dimensions: 1200 x 1600
6. Capture: Cmd/Ctrl + Shift + P → "Capture screenshot"
7. Save as: pollinator-poster.png
```

### For Instagram (1080x1080)
```bash
1. Open: /mnt/user-data/outputs/Pollinator_Instagram.html
2. Set dimensions: 1080 x 1080
3. Same capture process
4. Save as: pollinator-instagram.png
```

---

## METHOD 2: Command Line (Headless Chrome)

### Install (if not already)
```bash
# macOS
brew install --cask google-chrome

# Ubuntu/Debian
sudo apt-get install chromium-browser

# Already have Chrome? Use that path
```

### Generate Poster
```bash
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --headless \
  --disable-gpu \
  --screenshot=/path/to/pollinator-poster.png \
  --window-size=1200,1600 \
  --default-background-color=0 \
  file:///path/to/Pollinator_Poster.html

# Wait for animations to settle first
sleep 3
```

### Generate Instagram
```bash
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
  --headless \
  --disable-gpu \
  --screenshot=/path/to/pollinator-instagram.png \
  --window-size=1080,1080 \
  --default-background-color=0 \
  file:///path/to/Pollinator_Instagram.html

sleep 3
```

---

## METHOD 3: Puppeteer Script (Most Control)

### Create screenshot script
```javascript
// screenshot.js
const puppeteer = require('puppeteer');

async function captureHTML(htmlPath, outputPath, width, height) {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  
  await page.setViewport({ width, height });
  await page.goto(`file://${htmlPath}`, { waitUntil: 'networkidle0' });
  
  // Wait for animations
  await page.waitForTimeout(3000);
  
  await page.screenshot({
    path: outputPath,
    fullPage: false
  });
  
  await browser.close();
}

// Generate poster
captureHTML(
  '/full/path/to/Pollinator_Poster.html',
  'pollinator-poster.png',
  1200,
  1600
);

// Generate Instagram
captureHTML(
  '/full/path/to/Pollinator_Instagram.html',
  'pollinator-instagram.png',
  1080,
  1080
);
```

### Run it
```bash
npm install puppeteer
node screenshot.js
```

---

## METHOD 4: Online Tools

### CloudConvert
1. Visit: https://cloudconvert.com/html-to-png
2. Upload HTML file
3. Set dimensions in options
4. Convert
5. Download PNG

### HTML2Canvas (In-Browser)
1. Open HTML file
2. Open console (F12)
3. Paste and run:
```javascript
// Load html2canvas library
const script = document.createElement('script');
script.src = 'https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js';
document.head.appendChild(script);

script.onload = () => {
  html2canvas(document.body).then(canvas => {
    const link = document.createElement('a');
    link.download = 'screenshot.png';
    link.href = canvas.toDataURL();
    link.click();
  });
};
```

---

## RECOMMENDED SIZES

### Social Media Specs
```
Poster (Display):
- 1200 x 1600 (3:4 ratio)
- Format: PNG
- Quality: High

Instagram Feed:
- 1080 x 1080 (1:1 square)
- Format: JPG (smaller file)
- Quality: 85%

Instagram Story:
- 1080 x 1920 (9:16)
- Format: JPG
- Quality: 85%

LinkedIn Post:
- 1200 x 627 (1.91:1)
- Format: PNG
- Quality: High

Twitter/X:
- 1200 x 675 (16:9)
- Format: JPG
- Quality: 85%

Facebook:
- 1200 x 630 (1.91:1)
- Format: JPG
- Quality: 85%
```

---

## IMAGE OPTIMIZATION

### After capturing, optimize:

```bash
# Using ImageMagick (if installed)
brew install imagemagick

# Optimize PNG
convert pollinator-poster.png -quality 90 -strip pollinator-poster-optimized.png

# Convert to JPG and optimize
convert pollinator-poster.png -quality 85 -strip pollinator-poster.jpg
```

### Online Optimization
- TinyPNG: https://tinypng.com (PNG/JPG compression)
- Squoosh: https://squoosh.app (Google's optimizer)

---

## ASSET CHECKLIST

Generate these files for complete marketing kit:

**Primary:**
- [ ] pollinator-poster.png (1200x1600)
- [ ] pollinator-instagram-square.jpg (1080x1080)
- [ ] pollinator-instagram-story.jpg (1080x1920)

**Secondary:**
- [ ] pollinator-linkedin.png (1200x627)
- [ ] pollinator-twitter.jpg (1200x675)
- [ ] pollinator-facebook.jpg (1200x630)

**Optional:**
- [ ] pollinator-og-image.png (1200x630 for Open Graph)
- [ ] pollinator-thumbnail.jpg (600x600 for email)

---

## PRO TIPS

### Capture Timing
- Wait 3-5 seconds after page load for animations to settle
- Best frame is usually around 3 seconds
- Bee should be mid-flight, flower centered

### Quality
- Use PNG for gradients and smooth animations (poster)
- Use JPG for photos and when file size matters (social)
- Always save original high-res, then scale down

### Consistency
- Capture all images in one session
- Use same method for all
- Verify colors match across devices

### Backup
- Save HTML originals
- Keep high-res PNGs
- Document the capture settings used

---

## STORAGE & ORGANIZATION

```
assets/
└── images/
    ├── original/
    │   ├── pollinator-poster.png (high-res original)
    │   └── pollinator-instagram.png
    ├── optimized/
    │   ├── pollinator-poster-web.png (optimized for web)
    │   └── pollinator-instagram.jpg
    └── social/
        ├── instagram-feed.jpg
        ├── instagram-story.jpg
        ├── linkedin.png
        ├── twitter.jpg
        └── facebook.jpg
```

---

## TROUBLESHOOTING

**Animations don't capture:**
- Increase wait time before screenshot
- Capture at specific keyframe
- Or remove animations temporarily in HTML

**Colors look different:**
- Ensure sRGB color profile
- Check browser rendering mode
- Use same browser for all captures

**Text looks blurry:**
- Increase capture resolution 2x, then scale down
- Use PNG for text-heavy images
- Check font rendering settings

**File size too large:**
- Use JPG instead of PNG (when appropriate)
- Optimize with TinyPNG or Squoosh
- Reduce quality to 85% (usually imperceptible)

---

## NEED HELP?

If you're stuck on generating images:
1. Use Method 1 (Browser Screenshot) - simplest
2. Send HTML files to designer/VA
3. Use online service like CloudConvert

**Remember:** The HTML files are the source of truth. Images are just exports for platforms that need them.

---

*The bees don't worry about file formats. They just pollinate.* 🐝
