#!/usr/bin/env python3
import os
import sys
import subprocess
import shutil
from pathlib import Path
from typing import Dict, List, Optional, Callable, Any


class DotfilesInstaller:
    def __init__(self, repo_path: Path):
        self.repo_path = repo_path
        self.home = Path.home()

        # Configuration for each application
        self.apps: Dict[str, Dict[str, Any]] = {
            'bash': {
                'config_path': self.home / '.bashrc',
                'repo_config': self.repo_path / 'bash' / '.bashrc',
                'install_func': self.install_symlink,
                'prompt': 'Do you want to set .bashrc config?',
            },
            'fish': {
                'config_path': self.home / '.config' / 'fish',
                'repo_dir': self.repo_path / 'fish',
                'install_func': self.install_fish,
                'prompt': 'Do you want to configure fish?',
            },
            'tmux': {
                'config_path': self.home / '.tmux.conf',
                'repo_config': self.repo_path / 'tmux' / '.tmux.conf',
                'install_func': self.install_symlink,
                'prompt': 'Do you want to set tmux config?',
            },
            'alacritty': {
                'config_path': self.home / '.config' / 'alacritty' / 'alacritty.toml',
                'repo_dir': self.repo_path / 'alacritty',
                'install_func': self.install_alacritty,
                'prompt': 'Do you want to configure alacritty?',
            },
            'neovim': {
                'config_path': self.home / '.config' / 'nvim',
                'repo_config': self.repo_path / 'nvim',
                'install_func': self.install_neovim,
                'prompt': 'Do you want to set neovim config?',

                'palette_dir': self.repo_path / 'nvim' / 'lua' / 'palettes'
            },
            'hyprland': {
                'config_dir': self.home / '.config' / 'hypr',
                'repo_dir': self.repo_path / 'hypr',
                'install_func': self.install_copy_all_files,
                'prompt': 'Do you want to configure hyprland?',
                'files_to_install': [
                    'hyprland.conf',
                    'hyprlock.conf',
                    'hyprpaper.conf',
                ],
            },
            'waybar': {
                'config_dir': self.home / '.config' / 'waybar',
                'repo_dir': self.repo_path / 'waybar',
                'install_func': self.install_copy_all_files,
                'prompt': 'Do you want to configure waybar?',
                'files_to_install': [
                    'config.jsonc',
                    'style.css',
                ],
            },
            'gimp': {
                'config_dir': self.home / '.config' / 'GIMP',
                'repo_dir': self.repo_path / 'GIMP',
                'install_func': self.install_copy_all_files,
                'prompt': 'Do you want to configure GIMP?',
                'files_to_install': [
                    '2.10',
                    '3.0',
                ],
            },
            'kde .config': {
                'config_dir': self.home / '.config',
                'repo_dir': self.repo_path / 'KDE_Stuff' / 'Config',
                'install_func': self.install_copy_all_files,
                'prompt': 'Do you want to configure KDE  ~/.config files?',
                'files_to_install': [
                    'kglobalshortcutsrc',
                    'kwinrc',
                    'kxkbrc',
                    'plasma-org.kde.plasma.desktop-appletsrc',
                    'systemsettingsrc',
                ],
            },
            'kde .local': {
                'config_dir': self.home / '.local' / 'share',
                'repo_dir': self.repo_path / 'KDE_Stuff' / 'Local_Share',
                'install_func': self.install_copy_all_files,
                'prompt': 'Do you want to configure KDE ~/.local/share files?',
                'files_to_install': [
                    'color-schemes',
                    'konsole',
                ],
            },
        }

    def run(self):
        """Main entry point for the installer."""
        print(f"=== Dotfiles Installer ===")
        print(f"Repository path: {self.repo_path}")
        print()

        for app_name, app_config in self.apps.items():
            if self.ask_yes_no(app_config['prompt'], default='y'):
                try:
                    app_config['install_func'](app_name, app_config)
                    print()
                except OSError as e:
                    print(f"Error installing {app_name} config: {e}", file=sys.stderr)

    def install_symlink(self, app_name: str, config: Dict[str, Any]):
        self.create_symlink(config['repo_config'], config['config_path'], True)

    def install_copy_all_files(self, app_name: str, config: Dict[str, Any]):
        for filename in config['files_to_install']:
            if self.ask_yes_no(f"Do you want to copy '{filename}'?"):
                self.copy_file(config['repo_dir'] / filename, config['config_dir'] / filename, True)

        print("\033[1;4;31mMAKE SURE TO INSPECT THE CONFIGS AND REPLACE FILE PATHS!!!\033[0m")

    def install_fish(self, app_name: str, config: Dict[str, Any]):
        self.create_symlink(config['repo_dir'] / 'config.fish', config['config_path'] / 'config.fish', True)
        self.create_symlink(config['repo_dir'] / 'conf.d', config['config_path'] / 'conf.d', True)

    def install_alacritty(self, app_name: str, config: Dict[str, Any]):
        if Path(config['config_path']).exists():
            if not self.ask_yes_no("Alacritty config exists, do you want to reconfig?", default='n'):
                return

        config_content = '''
[general]
import = [
        '''

        themes = []
        fonts = []
        for filename in os.listdir(config['repo_dir']):
            if filename.startswith('theme-'):
                themes.append(filename[6:-5])
            if filename.startswith('font-'):
                fonts.append(filename[5:-5])

        # Theme selection
        print("Available themes:")
        for i, theme in enumerate(themes, 1):
            print(f"{i}. {theme}")

        selection = self.ask_choice("Choose theme: ", range(1, len(themes) + 1))
        selected_theme = f"theme-{themes[selection - 1]}.toml"

        # Font selection
        print("Available fonts:")
        for i, font in enumerate(fonts, 1):
            print(f"{i}. {font}")

        selection = self.ask_choice("Choose font: ", range(1, len(fonts) + 1))
        selected_font = f"font-{fonts[selection - 1]}.toml"

        # Font size
        font_size = float(input("Choose font size: "))

        # Blur
        use_blur = self.ask_yes_no("Enable blur?")

        config_content += f"\n\"{config['repo_dir'] / selected_theme}\","
        config_content += f"\n\"{config['repo_dir'] / selected_font}\""
        config_content += "\n]"


        config_content += f'''

live_config_reload = false

[window]
blur = {'true' if use_blur else 'false'}
title = "Terminal"
dynamic_title = false

[mouse]
hide_when_typing = true

[font]
size = {font_size}
        '''

        config['config_path'].parent.mkdir(parents=True, exist_ok=True)
        with open(config['config_path'], 'w') as file:
            file.write(config_content)

    def install_neovim(self, app_name: str, config: Dict[str, Any]):
        # First install the config
        self.create_symlink(config['repo_config'], config['config_path'], False)

        # Theme selection
        themes = []
        for filename in os.listdir(config['palette_dir']):
            themes.append(filename[:-4])

        print("Available fonts:")
        for i, theme in enumerate(themes, 1):
            print(f"{i}. {theme}")

        selection = self.ask_choice("Choose font: ", range(1, len(themes) + 1))
        selected_theme = themes[selection - 1]

        subprocess.run(['fish', '-c', f"set -Ux NOVA_PALETTE {selected_theme}"])

    @staticmethod
    def handle_existing_config(config_path: Path):
        """Handle existing config file by backing it up."""
        if config_path.exists():
            backup_path = config_path.with_name(f"{config_path.name}.bak")
            if backup_path.exists():
                backup_path.unlink()
            config_path.rename(backup_path)
            print(f"Backed up existing config to {backup_path}")

    @staticmethod
    def create_symlink(target: Path, link: Path, handle_existing = True):
        # Ensure parent directory exists
        link.parent.mkdir(parents=True, exist_ok=True)

        if handle_existing:
            # Handle existing config (backup or skip)
            DotfilesInstaller.handle_existing_config(link)

        # Create symlink
        os.symlink(target, link)
        print(f"Created symlink: {link} -> {target}")

    @staticmethod
    def copy_file(src: Path, dst: Path, handle_existing = True):
        # Ensure parent directory exists
        dst.parent.mkdir(parents=True, exist_ok=True)

        if handle_existing:
            # Handle existing config (backup or skip)
            DotfilesInstaller.handle_existing_config(dst)

        if src.is_file():
            shutil.copy(src, dst)
            print(f"Copied file: {src} -> {dst}")
        elif src.is_dir():
            shutil.copytree(src, dst)
            print(f"Copied file tree: {src} -> {dst}")

    @staticmethod
    def ask_yes_no(prompt: str, default: str = 'y') -> bool:
        """Ask a yes/no question and return the result."""
        valid = {'y': True, 'n': False}
        if default is None:
            prompt += ' [y/n] '
        else:
            prompt += ' [Y/n] ' if default.lower() == 'y' else ' [y/N] '

        while True:
            choice = input(prompt).lower().strip()
            if not choice and default is not None:
                return valid[default.lower()]
            if choice in valid:
                return valid[choice]
            print("Please respond with 'y' or 'n'")

    @staticmethod
    def ask_choice(prompt: str, valid_range: range) -> int:
        """Ask to select from a range of choices."""
        while True:
            try:
                choice = input(prompt)
                if not choice:
                    raise ValueError("No input provided")
                choice = int(choice)
                if choice not in valid_range:
                    raise ValueError("Invalid selection")
                return choice
            except ValueError as e:
                print(f"Invalid input: {e}. Please try again.")


if __name__ == "__main__":
    # Get the repository path (where this script is located)
    repo_path = Path(__file__).parent.resolve()

    installer = DotfilesInstaller(repo_path)
    installer.run()
