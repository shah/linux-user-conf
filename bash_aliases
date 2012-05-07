alias ll='ls -al'

# show the top 10 memory consuming processes
alias ps-top-mem='ps auxf | sort -nr -k 4 | head -10'

# show the top 10 CPU consuming processes
alias ps-top-cpu='ps auxf | sort -nr -k 3 | head -10'

# show long format with full command lines of all processes
alias ps-full='ps -AlF'

# show which services are running at startup
alias show-services-startup="chkconfig --list | grep '3:on'"

# show which ports are open and actively listening
alias show-ports-listening='sudo netstat -tulpn'

# show which ports are available from outside (not firewalled)
alias show-ports-open='sudo nmap -sT -O `hostname`'

