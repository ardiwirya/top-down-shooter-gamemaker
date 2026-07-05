# 🧟 Zombie Siege — 2D Top-Down Survival Shooter

> A 2D top-down zombie survival shooter built with **GameMaker Studio 2**, made as a game development coursework project (Semester 6). Fight off waves of zombies, pick up weapons, blow up crates, and survive as long as you can.

![Gameplay Preview](./docs/preview.png)

---

## 📖 About

**Zombie Siege** is a top-down arena shooter where the player fights off waves of zombies using different weapons picked up around the map. The project focuses on core action-game mechanics: movement, shooting, enemy AI, collision, pickups, and a simple game-loop (start → play → die → restart).

This project was built for the **Game Development** course as a hands-on way to learn **GameMaker Studio 2 (GML)** — object-oriented game logic, sprite/animation pipelines, room/level design, and basic game feel (screen shake / hit flash / VFX).

> 📌 **Learning note:** This project was built by following a game development tutorial series to learn GameMaker fundamentals (movement, shooting systems, enemy spawning, collisions). It has since been extended/modified with additional mechanics. It's shared here as a learning log rather than a fully original design — see [Credits](#-credits--acknowledgements) below.

---

## ✨ Features

- 🔫 **Multiple weapons** — pistol, shotgun, and sniper rifle, each with different fire rate, spread, and damage
- 🧟 **Enemy AI & spawner system** — zombies spawn in waves and chase the player
- ❤️ **Health & damage system** — player health (hearts), enemy health bars, hit-flash feedback
- 💥 **Interactive environment** — destructible crates, explosive (TNT) crates, weapon pickup crates
- 🎯 **HUD** — live ammo counter, kill counter, health display
- 📷 **Camera follow system** that tracks the player across the room
- ⏸️ **Pause menu** and **Game Over screen** with a one-click restart (à la Chrome Dino)
- 🎨 Pixel-art tileset environment (grass, dirt paths, water, buildings, props)

---

## 🕹️ Controls

| Action        | Key / Input        |
|---------------|---------------------|
| Move          | `W` `A` `S` `D`     |
| Aim           | Mouse               |
| Shoot         | Left Mouse Button   |
| Pause         | `Esc`               |

*(Adjust this table if your actual key bindings differ.)*

---

## 🛠️ Tech Stack

- **Engine:** GameMaker Studio 2
- **Language:** GML (GameMaker Language)
- **Art:** Pixel-art sprites & tilesets

---

## 🚀 Getting Started

### Prerequisites
- [GameMaker Studio 2](https://gamemaker.io/en/download) installed (free tier is enough to open/run the project)

### Run the project
1. Clone this repository
   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   ```
2. Open **GameMaker Studio 2**
3. Open the project file: `TOP DOWN SHOOTER/TOP DOWN SHOOTER.yyp`
4. Click **Run** ▶️

> A pre-exported Windows build (`install.exe`) is also included in the project folder if you just want to play without opening the IDE.

---

## 📂 Project Structure

```
TOP DOWN SHOOTER/
├── objects/       # Game objects & logic (oPlayer, oZombie, oBullet, oHUD, etc.)
├── sprites/        # Character, weapon, enemy & environment sprites
├── rooms/          # Game levels/rooms
├── scripts/        # Reusable GML scripts (weapon creation, custom functions)
├── tilesets/       # Ground/environment tilesets
├── fonts/          # UI fonts
└── TOP DOWN SHOOTER.yyp   # Main GameMaker project file
```

---

## 🧭 Roadmap / Known Limitations

This is a coursework/learning project, so a few things are intentionally minimal:

- [ ] Main menu (currently the game starts immediately on launch)
- [ ] Multiple levels / level progression
- [ ] Sound effects & background music
- [ ] Difficulty scaling / wave system tuning
- [ ] Settings menu (volume, controls)

Contributions or suggestions are welcome via Issues/PRs.

---

## 🙏 Credits & Acknowledgements

- Core mechanics learned from a public GameMaker Studio 2 tutorial series (top-down shooter genre)
- Pixel-art assets: *(fill in the asset pack name / itch.io link / artist credit here)*
- Built and extended by **[Your Name]** as part of the Game Development course, Semester 6

---

## 📄 License

This project is for educational purposes. Code in this repository is shared under the [MIT License](LICENSE) unless noted otherwise. Art assets may be subject to their original author's license — please check before reuse.

---

## 👤 Author

**[Your Name]**
- GitHub: [@your-username](https://github.com/your-username)
- Portfolio: *(optional link)*
