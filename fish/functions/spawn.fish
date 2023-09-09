function spawn --wraps='~/bin/fish-scripts/spawn.fish' --wraps='~/bin/fish-scripts/spawn.fish '
    
    # set the help message string, scoped to the function

    # we want to tell argparse about the help menu, and to exit if an error is 
    # encountered or any failure occured.
    argparse -i --name=spawn 'h/help' -- $argv
    or return

    # if -h or --help is given 
    if set -ql _flag_help 
        echo "Spawn a program detatched from the parent shell."
        echo "STDOUT/STDERR of orphan is ignored."
        echo -e "Example: 'spawn firefox'\n"
        echo "calls 'firefox &>/dev/null & disown'" 
    else if test $(count $argv) -lt 1
        echo "Need at least 1 argument. Try 'spawn -h'"
    else
        $argv[1] $argv[2..-1] &>/dev/null & disown
    end
end
