import os
import pathlib


def apt_install(package_name):
    info(f"Installing {package_name}")
    run_command(f"sudo apt install {package_name}")


def run_command(command):
    os.system(command)


def create_symlink(from_, to):
    info(f"Creating symlink {from_} -> {to}")
    run_command(f"ln -s {from_} {to}")


def info(msg):
    print()
    print(msg)


if __name__ == "__main__":
    import sys
    if sys.version_info < (3,6):
        raise RuntimeError("Script must be run with python 3.6 or higher")

    # NVIM
    apt_install("neovim")

    # ZSH
    apt_install("zsh")
    info("Setting zsh as default shell")
    run_command("chsh -s $(which zsh)")

    # OH-MY-ZSH
    info("Installing oh-my-zsh")
    run_command('sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')
    info("Cloning zsh-autosuggestions")
    run_command('git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions')

    HOME = pathlib.Path("~").expanduser()
    DOTFILES_DIR = HOME.joinpath("dotfiles")
    NEOVIM_CONFIG_DIR = HOME.joinpath(".config", "nvim")

    info(f"Creating neovim config dir at {NEOVIM_CONFIG_DIR}")
    NEOVIM_CONFIG_DIR.mkdir(exist_ok=True)

    create_symlink(from_=DOTFILES_DIR.joinpath('nvim', 'init.vim'), to=NEOVIM_CONFIG_DIR)

    info("Deleting existing file for .zshrc and creating symlink")
    run_command(f"rm {HOME.joinpath('.zshrc')}")
    create_symlink(from_=DOTFILES_DIR.joinpath('.zshrc'), to=HOME)

    info("Creating python3 environment for neovim")
    NEOVIM_DIR = HOME.joinpath("nvim")
    NEOVIM_DIR.mkdir(exist_ok=True)
    run_command(f"cd {NEOVIM_DIR} && python3 -m venv neovim3")

    info("Installing neovim in virtual env")
    PIP = NEOVIM_DIR.joinpath("neovim3/bin/pip")
    run_command(f"{PIP} install neovim")

    info("Installing black in virtual env")
    run_command(f"{PIP} install black")

    info("Installing vim Plug")
    run_command("curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim")

    apt_install("tmux")
    create_symlink(from_=DOTFILES_DIR.joinpath('.tmux.conf'), to=HOME)

    info("Installing ripgrep and fzy for file searching")
    apt_install("ripgrep")
    apt_install("fzy")

    print()
    print(" #### REMINDERS ##### ")
    info("Now you must run :PlugInstall inside neovim!")
