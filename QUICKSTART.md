# Quick Start Guide
## The Pollinator's Return

### 🚀 Deploy to GitHub Pages (5 minutes)

#### Step 1: Create Repository
```bash
# On GitHub.com
1. Click "New repository"
2. Name: "pollinator-showcase" (or your choice)
3. Public repository
4. Don't initialize with README (we have one)
5. Create repository
```

#### Step 2: Push Code
```bash
# In your terminal
cd pollinator-showcase
git init
git add .
git commit -m "Initial commit: The Pollinator's Return showcase"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/pollinator-showcase.git
git push -u origin main
```

#### Step 3: Enable GitHub Pages
```bash
# On GitHub.com
1. Go to your repository
2. Click "Settings"
3. Scroll to "Pages" in left sidebar
4. Source: Deploy from "main" branch, "/ (root)" folder
5. Save
6. Wait 2-3 minutes
7. Visit: https://YOUR_USERNAME.github.io/pollinator-showcase
```

#### Step 4: Custom Domain (Optional)
```bash
# DNS Configuration
1. Add CNAME record in your DNS:
   - Name: pollinator
   - Value: YOUR_USERNAME.github.io
   
2. In GitHub Pages settings:
   - Custom domain: pollinator.forteen.in
   - Save
   - Wait for DNS propagation (5-30 minutes)
   - Enable "Enforce HTTPS"
```

---

### 🏠 Local Development

#### Option 1: Direct Open
```bash
# Simply open in browser
open index.html
```

#### Option 2: Python Server
```bash
# If you have Python 3
python3 -m http.server 8000

# Visit: http://localhost:8000
```

#### Option 3: Node.js Server
```bash
# If you have Node.js
npx http-server -p 8000

# Visit: http://localhost:8000
```

---

### 📁 File Structure

```
pollinator-showcase/
├── index.html           # Homepage (hero treatment)
├── episode.html         # Full interactive experience
├── about.html           # About page
├── CNAME               # Custom domain configuration
├── LICENSE             # CC BY-NC-ND 4.0
├── README.md           # Full documentation
├── QUICKSTART.md       # This file
├── .gitignore          # Git ignore rules
├── docs/
│   ├── DESIGN_ARCHIVE.md    # Design documentation
│   └── SOCIAL_MEDIA.md      # Marketing copy
└── assets/
    └── images/              # Future: botanical illustrations
```

---

### ✅ Deployment Checklist

- [ ] Repository created on GitHub
- [ ] Code pushed to main branch
- [ ] GitHub Pages enabled
- [ ] Site accessible at github.io URL
- [ ] Custom domain configured (optional)
- [ ] DNS propagated (if using custom domain)
- [ ] HTTPS enabled
- [ ] Test on mobile device
- [ ] Test on different browsers

---

### 🎨 Customization

#### Change Domain
Edit `CNAME` file:
```
your-domain.com
```

#### Update Branding
Edit these files:
- `index.html` - Hero section, footer
- `about.html` - Contact information
- `README.md` - Credits section

#### Add Analytics (Optional)
Add before `</head>` in all HTML files:
```html
<!-- Google Analytics or your preferred analytics -->
```

---

### 🐛 Troubleshooting

#### Site not loading after GitHub Pages enabled?
- Wait 2-3 minutes for deployment
- Check Actions tab for build status
- Clear browser cache

#### Custom domain not working?
- Verify DNS configuration (use DNS checker tool)
- Wait for DNS propagation (up to 48 hours, usually 5-30 min)
- Ensure CNAME file contains only domain name (no http://)

#### Images not loading?
- Check file paths are relative (./image.jpg not /image.jpg)
- Verify files are committed to repository
- Clear browser cache

---

### 📱 Share Links

**Homepage:**
- Production: `https://pollinator.forteen.in`
- GitHub Pages: `https://YOUR_USERNAME.github.io/pollinator-showcase`

**Direct to Experience:**
- `https://pollinator.forteen.in/episode.html`

**About:**
- `https://pollinator.forteen.in/about.html`

---

### 📧 Support

Questions? Issues?

- **Email:** hello@forteen.in
- **GitHub Issues:** [Open an issue](https://github.com/YOUR_USERNAME/pollinator-showcase/issues)

---

### 🎉 You're Done!

The experience is live. Share it. Iterate based on feedback.

Remember: Like sushi, we're an acquired taste.
