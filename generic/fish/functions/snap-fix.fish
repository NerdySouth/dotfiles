function snap-fix --wraps='sudo apparmor_parser -r /etc/apparmor.d/*snap-confine* && sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/snap-confine*' --description 'alias snap-fix sudo apparmor_parser -r /etc/apparmor.d/*snap-confine* && sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/snap-confine*'
  sudo apparmor_parser -r /etc/apparmor.d/*snap-confine* && sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/snap-confine* $argv
        
end
