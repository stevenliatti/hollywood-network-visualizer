include .env
export

show_env: .env
	@cat .env

ping_remote:
	pssh -t 0 --user $(REMOTE_USER) --hosts $(IPS) --inline-stdout "echo pong"

check_remote:
	pssh -t 0 --user $(REMOTE_USER) --hosts $(IPS) -i "curl -s \"localhost:3000/search?criteria=jack&limitActors=1&limitMovies=1\"; echo"

kill_remote:
	pssh -t 0 --user $(REMOTE_USER) --hosts $(IPS) --inline-stdout "$(REMOTE_WORKING_DIR)/kill.sh"

clean_remote:
	ssh $(REMOTE_USER)@$(REMOTE_HOST) rm -rf $(REMOTE_WORKING_DIR)
