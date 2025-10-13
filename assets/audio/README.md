# DCK$ Audio Assets

This directory is for audio files used by the KREW$ header music player.

## Required Audio Files

Place the following audio files in this directory:
- `assets/audio/wet-paint.mp3` - Main audio track (MP3 format for broad compatibility)
- `assets/audio/wet-paint.ogg` - Fallback audio track (OGG format for Firefox/open-source browsers)

**Note:** Placeholder audio files are NOT included in this repository to avoid committing binary files. You must provide your own audio files.

## One-liner Injection Option

If you prefer to inject the music player dynamically via JavaScript instead of editing the HTML directly, you can use this snippet:

```javascript
// Inject KREW$ music player + socials footer dynamically
(function(){
  const player = document.createElement('div');
  player.id = 'krewMusicPlayer';
  player.innerHTML = `
    <audio id="krewAudio" loop preload="metadata" aria-label="KREW$ background music">
      <source src="/assets/audio/wet-paint.mp3" type="audio/mpeg">
      <source src="/assets/audio/wet-paint.ogg" type="audio/ogg">
    </audio>
    <button id="toggleMusic" aria-label="Play/Pause KREW$ music" style="position:fixed;top:80px;right:20px;z-index:9999;padding:8px 16px;background:#39ff14;color:#000;border:2px solid #000;border-radius:8px;font-weight:bold;cursor:pointer;font-family:system-ui;box-shadow:0 4px 12px rgba(57,255,20,.4)">
      🎵 PLAY
    </button>
    <footer style="position:fixed;bottom:0;left:0;right:0;background:rgba(0,0,0,.85);backdrop-filter:blur(10px);padding:12px;text-align:center;border-top:1px solid rgba(255,255,255,.1);z-index:9998;font-size:14px">
      <a href="https://twitter.com/dcktoken" target="_blank" rel="noopener" style="color:#39ff14;margin:0 10px;text-decoration:none">Twitter</a>
      <a href="https://t.me/dcktoken" target="_blank" rel="noopener" style="color:#39ff14;margin:0 10px;text-decoration:none">Telegram</a>
      <a href="https://discord.gg/dcktoken" target="_blank" rel="noopener" style="color:#39ff14;margin:0 10px;text-decoration:none">Discord</a>
    </footer>
  `;
  document.body.appendChild(player);
  
  const audio = document.getElementById('krewAudio');
  const btn = document.getElementById('toggleMusic');
  btn.addEventListener('click', () => {
    if (audio.paused) {
      audio.play();
      btn.textContent = '🎵 PAUSE';
    } else {
      audio.pause();
      btn.textContent = '🎵 PLAY';
    }
  });
})();
```

## Usage Notes

### Accessibility
- The audio player includes `aria-label` attributes for screen reader accessibility
- The play/pause button is keyboard-accessible
- Audio does NOT autoplay by default (user must click the button)

### Autoplay Behavior
Modern browsers block autoplay with sound to protect users. The current implementation:
- Audio is set to `loop` for continuous playback once started
- User must explicitly click the play button to start music
- If you want autoplay (muted initially), change the audio tag to include `autoplay muted` and update the button logic accordingly

### Browser Compatibility
- MP3 format works in all modern browsers
- OGG format provides a fallback for Firefox and browsers that prefer open formats
- The player gracefully degrades if audio files are missing
