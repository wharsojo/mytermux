if [ $# -lt 2 ]; then
   if [ $# -eq 1 ]; then
      printf "$red incomplete [arguments], at least one argument\n\n$reset"
   fi
   printf "$blue"
   printf "mtx	v0.1.6 \n"
   printf "Use mtx [options] <command> [arguments] \n\n"
   printf "Commands:\n"
   printf "i/install	alpine debian centos fedora kali nethunter ubuntu\n"
   printf "u/uninstall	alpine\n"
   printf "s/start    	alpine\n"
   printf "d/download	gitea\n"
   printf "r/remove	gitea\n\n"
   printf "Example - i/install:\n"
   printf "* mtx install alpine\n"
   printf "* mtx -c i centos\n"
   printf "\n"
   printf "Example - d/download:\n"
   printf "* mtx d gitea\n"
   printf "\n"
fi

