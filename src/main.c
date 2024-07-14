#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <time.h>

#define HEALTH_BROADCAST_SCRIPT_PATH "sh ./scripts/health_broadcast.sh"
#define SLEEP_TIME_SECONDS 2
#define SLEEP_SCRIPT_PATH_AND_ARGS "sh ./scripts/sleep.sh 2"


#define PATH_MAX 5000000000

int main(int argc, char** argv) {
	/*printf(argv[0]);
	char cwd[PATH_MAX];
   if (getcwd(cwd, sizeof(cwd)) != NULL) {
       printf("Current working dir: %s\n", cwd);
   } else {
       perror("getcwd() error");
       return 1;
   }

   char script_path[sizeof(cwd) + sizeof(HEALTH_BROADCAST_SCRIPT_PATH)];
	strcpy(script_path, cwd);
	strcat(script_path, HEALTH_BROADCAST_SCRIPT_PATH);
*/
	int quantum = 5000;
	int run = 1;
	char *script_args[]={"sh", HEALTH_BROADCAST_SCRIPT_PATH, NULL};
	while (run) {
		printf("sh "HEALTH_BROADCAST_SCRIPT_PATH"\n");
		//int status = execvp(script_args[0], script_args);
		int status = system(HEALTH_BROADCAST_SCRIPT_PATH); //script_path);
		if (status) {
			printf("Health broadcast failed with result %d\n", status);
			if (status == 2) {
				
				printf("Status is 2, indicating interrupt, exiting...");
				return status;
			}
		} else {
			printf("Health broacase succeeded with result %d\n", status);
		}
		printf("Sleeping %d seconds\n", SLEEP_TIME_SECONDS);
		/*nanosleep({
				tv_sec = 1,
				tv_nsec = 0
				});*/
		//pause(SLEEP_TIME_SECONDS);
		system(SLEEP_SCRIPT_PATH_AND_ARGS);
	}
	return 0;
}
