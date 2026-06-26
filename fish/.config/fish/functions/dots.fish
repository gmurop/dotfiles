function dots -d "Manage dotfiles with stow"
    switch $argv[1]
        case link l
            stow -Rv --dir=~/dotfiles --target=~ $argv[2..]
        case unlink u
            stow -Dv --dir=~/dotfiles --target=~ $argv[2..]
        case add a
            stow --adopt -v --dir=~/dotfiles --target=~ $argv[2..]
        case list ls
            ls ~/dotfiles
        case '*'
            echo "Usage: dots [link|unlink|add|list] [package...]"
    end
end
