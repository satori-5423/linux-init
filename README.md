# Linux预设方案 (GNOME桌面)

## 应用 (Applications)
📱 [Chrome](https://www.google.com/chrome/)  
📱 [Clash Verge](https://github.com/clash-verge-rev/clash-verge-rev/)  
📱 [Hidamari](https://github.com/jeffshee/hidamari/)  
📱 [Lutris](https://lutris.net/)  
📱 [OnlyOffice](https://www.onlyoffice.com/)  
📱 [Steam](https://store.steampowered.com/)  
📱 [Timeshift](https://github.com/linuxmint/timeshift/)  
📱 [Visual Studio Code](https://code.visualstudio.com/)  
📱 [Zed](https://zed.dev/)

## 主题 (Themes)
🎨 [Bibata Modern Ice](https://www.pling.com/p/1197198/)  
🎨 [Fluent](https://www.pling.com/p/1477941/)  
🎨 [Orchis](https://www.pling.com/p/1357889/)  
🎨 [Tela icon](https://www.pling.com/p/1279924/)  
🎨 [Lycoris Recoil (GRUB)](https://www.pling.com/p/2143960/)

## 扩展 (Extensions)
🗂️ [Apps Menu](#apps-menu)  
🗂️ [Blur my Shell](#blur-my-shell)  
🗂️ [Burn My Windows](#burn-my-windows)  
🗂️ [Dash to Dock](#dash-to-dock)  
🗂️ [Disable unredirect fullscreen windows](#disable-unredirect-fullscreen-windows)  
🗂️ [Hide Top Bar](#hide-top-bar)  
🗂️ [Logo Menu](#logo-menu)  
🗂️ [Network Stats](#network-stats)  
🗂️ [Places Status Indicator](#places-status-indicator)  
🗂️ [User Themes](#user-themes)  

**Note**: **当扩展显示不兼容而无法使用时，执行** `gsettings set org.gnome.shell disable-extension-version-validation true` **禁用兼容性检查**

## 设置 (Settings)

### 🔧 <span id="appearance"></span>外观 (Appearance)
- **样式**
  - **光标**: `Bibata-Modern-Ice`
  - **图标**: `Tela`
  - **Shell**: `Orchis`
  - **过时应用程序**: `Fluent-Light`
- **背景**
  - **调整**: `Zoom`

### 🔧 <span id="fonts"></span>字体 (Fonts)
- **界面文本**: `霞鹜文楷 12`
- **文档文本**: `DejaVu Sans Mono Book 12`
- **等宽文本**: `Noto Sans Mono Medium 12`
- **旧式窗口标题**: `Cantarell Bold 12`
- **微调**: `完全`
- **抗锯齿**: `标准（灰度）`
- **缩放比例**: `1.20`

### 🔧 <span id="others"></span>其他 (Others)
- **Gnome Terminal**
  - **终端起始尺寸**: `96列 26行`
- **GRUB**
  - **引导顺序**: **移动**`/etc/grub.d/30_os-prober`**到**`/etc/grub.d/08_os-prober`**以更改操作系统读取优先级**
  - **系统名称**: **注释**`/etc/grub.d/08_os-prober`**中的**`onstr`**赋值语句以隐藏系统名称后尾随的**`(on ${DEVICE})`**字符串**
  - **隐藏root用户登录项**: **将**`/var/lib/AccountsService/users/root`**中的**`[User] SystemAccount`**属性改为**`true`

### 🌀 <span id="apps-menu"></span>[Apps Menu](https://extensions.gnome.org/extension/6/applications-menu/)
- 🚀 **GitLab**: [GNOME/gnome-shell-extensions](https://gitlab.gnome.org/GNOME/gnome-shell-extensions/)

### 🌀 <span id="blur-my-shell"></span>[Blur my Shell](https://extensions.gnome.org/extension/3193/blur-my-shell/)
- 🚀 **GitHub**: [aunetx/blur-my-shell](https://github.com/aunetx/blur-my-shell/)

1. **Pipelines**
  - **Native gaussian blur**
    - **Radius**: `30`
    - **Brightness**: `0.72`
  - **Monte Carlo blur**
    - **Radius**: `0.24`
    - **Iterations**: `5`
    - **Brightness**: `1.00`
    - **Use base pixel**: `On`

2. **Panel** *(close)*

3. **Overview**
  - **Background blur**
    - **Pipeline**: `Default`
    - **Overview components style**: `Light`
  - **Application folder blur**
    - **Sigma**: `12`
    - **Brightness**: `0.72`
    - **Application folder dialogs style**: `Transparent`

4. **Dash** *(close)*

5. **Applications** *(close)*

6. **Other**
  - **Lockscreen blur**
    - **Pipeline**: `Default`
  - **Screenshot blur**
    - **Pipeline**: `Default`
  - **Window list extension blur**
    - **Sigma**: `12`
    - **Brightness**: `0.72`
  - **Coverflow Alt-Tab extension blur**
    - **Pipeline**: `Default`

7. **Performance**
  - **Hack level**: `Default`
  - **Debug**: `Off`

### 🌀 <span id="burn-my-windows"></span>[Burn My Windows](https://extensions.gnome.org/extension/4679/burn-my-windows/)
- 🚀 **GitHub**: [Schneegans/Burn-My-Windows](https://github.com/Schneegans/Burn-My-Windows/)

### 🌀 <span id="dash-to-dock"></span>[Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)
- 🚀 **Website**: [micheleg.github.io/dash-to-dock](https://micheleg.github.io/dash-to-dock/)
- 🚀 **GitHub**: [micheleg/dash-to-dock](https://github.com/micheleg/dash-to-dock/)

1. **位置和大小**
  - **屏幕中的位置**: `底部`
  - **智能隐藏**: `On`
    - **在全屏模式下启用**: `On`
    - **推压以显示：需要一定压力来显示Dock**: `On`
    - **有紧急通知是显示Dock**: `On`
    - **避开窗口**: `Off`
    - **动画持续时间（秒）**: `0.200`
    - **隐藏超时时间（秒）**: `0.200`
    - **压力阈值**: `200`
  - **Dock大小限制**: `90%`
    - **面板模式：延伸到屏幕边缘**: `Off`
  - **图标大小限制**: `72px`
    - **固定图标大小：滚动显示其他图标**: `Off`
  - **预览大小比例**: `0.00`

2. **启动器**
  - **显示被固定的应用程序**: `On`
  - **显示正在运行的应用程序**: `On`
    - **显示打开窗口预览**: `On`
    - **隔离工作区**: `Off`
    - **在当前工作区显示紧急窗口**: `On`
    - **隔离显示器**: `Off`
  - **保持焦点在Dash中始终可见**: `On`
  - **显示应用程序图标**: `On`
    - **移至Dock的起始位置**: `Off`
    - **显示应用程序时播放动画**: `Off`
    - **使用面板模式时将显示应用放到Dock的边缘**: `On`
  - **显示回收站**: `On`
  - **显示宗卷和设备**: `On`
    - **仅显示已挂载**: `On`
    - **包括网络宗卷**: `Off`
  - **从文件管理器中分离显示宗卷、设备和回收站窗口**: `On`
  - **摇动紧急应用**: `On`
  - **隐藏应用工具提示**: `Off`
  - **显示图标角标**: `Off`
    - **显示未读通知数量**: `On`
    - **使用应用提供计数器替代通知计数器**: `On`

3. **行为**
  - **使用键盘快捷键激活应用**: `Off`
  - **点击动作**: `聚焦或显示应用分览`
  - **滚动动作**: `在窗口间循环`

4. **外观**
  - **收缩Dash**: `Off`
  - **启动时显示概览**: `On`
  - **使用内置主题**: `Off`
  - **显示窗口个数指示器**: `圆点`
  - **自定义Dash颜色**: `On (纯黑)`
  - **自定义不透明度**: `固定`
  - **不透明度**: `25%`

### 🌀 <span id="disable-unredirect-fullscreen-windows"></span>[Disable unredirect fullscreen windows](https://extensions.gnome.org/extension/1873/disable-unredirect-fullscreen-windows/)
- 🚀 **GitHub**: [kazysmaster/gnome-shell-extension-disable-unredirect](https://github.com/kazysmaster/gnome-shell-extension-disable-unredirect/)

### 🌀 <span id="hide-top-bar"></span>[Hide Top Bar](https://extensions.gnome.org/extension/545/hide-top-bar/)
- 🚀 **GitLab**: [tuxor1337/hidetopbar](https://gitlab.gnome.org/tuxor1337/hidetopbar/)

1. **Sensitivity**
  - **Show panel when mouse approaches edge of the screen**: `On`
  - **In the above case, also show panel when fullscreen**: `On`
  - **Show panel in overview**: `On`
  - **Keep hot corner sensitive, even in hidden state**: `Off`
  - **In the above case show overview, too**: `Off`
  - **Keep round corners when top bar is hidden**: `Off`
  - **Pressure barrier's threshold**: `100`
  - **Pressure barrier's timeout**: `1000`

2. **Animation**
  - **Slide animation time when entering/leaving overview**: `0.4`
  - **Slide animation time when mouse approaches edge of the screen**: `0.2`

3. **Keyboard shortcuts**
  - **Key that triggers the bar to be shown (press backspace to deactivate the shortcut)**: `禁用`
  - **Delay before the bar rehides after key press (a value of 0 disables the rehiding)**: `1.0`
  - **Pressing the shortcut again rehides the panel**: `On`

4. **Intellihide**
  - **Only hide panel when a window takes the space**: `Off`
  - **Only when the active window takes the space**: `Off`

### 🌀 <span id="logo-menu"></span>[Logo Menu](https://extensions.gnome.org/extension/4451/logo-menu/)
- 🚀 **GitHub**: [Aryan20/Logomenu](https://github.com/Aryan20/Logomenu/)

- **Other Options**
  - **设定参数**
    - **点击活动指示器图标显示活动**: `中键`
    - **Preferred Extensions Application**: `GNOME Extensions`
    - **终端**: `gnome-terminal`
    - **软件中心**: `gnome-software`
    - **System Monitor**: `gnome-system-monitor`
  - **显示/隐藏 选项**
    - **显示电源选项**: `Off`
    - **隐藏强制退出**: `On`
    - **显示锁屏**: `Off`
    - **隐藏软件中心**: `On`
  - **Top Panel Options**
    - **Show Activities Button**: `Off`
    - **Hide Icon Shadow**: `Off`

### 🌀 <span id="network-stats"></span>[Network Stats](https://extensions.gnome.org/extension/4308/network-stats/)
- 🚀 **GitHub**: [noroadsleft000/gnome-network-stats](https://github.com/noroadsleft000/gnome-network-stats/)

- **Refresh Interval (ms)**: `1500`
- **What to show in status bar**: `Total speed`
- **When do you want to reset the stats**: `Daily`
- **What time should we reset network stats**: `0:0`
- **Show speeds in bytes instead of bits**: `On`
- **Show icon in status bar (requires reload)**: `On`

### 🌀 <span id="places-status-indicator"></span>[Places Status Indicator](https://extensions.gnome.org/extension/8/places-status-indicator/)
- 🚀 **GitLab**: [GNOME/gnome-shell-extensions](https://gitlab.gnome.org/GNOME/gnome-shell-extensions/)

### 🌀 <span id="user-themes"></span>[User Themes](https://extensions.gnome.org/extension/19/user-themes/)
- 🚀 **GitLab**: [GNOME/gnome-shell-extensions](https://gitlab.gnome.org/GNOME/gnome-shell-extensions/)

- **Themes**: `Orchis`
