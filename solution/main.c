#include <malloc.h>
#include <string.h>
#include "functional_heaven.h"

void allocate() {
	input_string = (char*)malloc(MAX_STRING_SIZE * sizeof(char));
	result_string = (char*)malloc(MAX_STRING_SIZE * sizeof(char));
}

void dispose() {
	free(input_string);
	free(result_string);
	if (input_file != stdin && input_file != NULL) {
		fclose(input_file);
	}
	if (output_file != stdout && output_file != NULL) {
		fclose(output_file);
	}
}

int main(int argc, char *argv[]) {
	char *input_file_path = NULL;
	char *output_file_path = NULL;
	int size_of_random_string = 0;
	int testing_iteration_count = 0;
	if (argc % 2 != 1) {
		printf("Error. Each argument must be presented as <arg tag> <arg value>\n");
		return 1;
	}
    for (int i = 1; i < argc - 1; i += 2) {
		if (strcmp(argv[i], "-i") == 0) {
			input_file_path = argv[i + 1];
			continue;
		}
		if (strcmp(argv[i], "-o") == 0) {
			output_file_path = argv[i + 1];
			continue;
		}
		if (strcmp(argv[i], "-g") == 0) {
			size_of_random_string = atoi(argv[i + 1]);
			if (size_of_random_string < 1 || size_of_random_string > MAX_STRING_SIZE) {
				printf("Error. Size of random string must be an integer from 1 to %d\n", MAX_STRING_SIZE);
				return 1;
			}
			continue;
		}
		if (strcmp(argv[i], "-t") == 0) {
			testing_iteration_count = atoi(argv[i + 1]);
			if (testing_iteration_count <= 0) {
				printf("Error. Testing iteration count must be a positive integer\n");
				return 1;
			}
			continue;
		}
		printf("Unknown arg tag: %s\n", argv[i]);
		return 1;
	}

	allocate();
	if (input_file_path == NULL) {
		input_file = stdin;
	} else {
		input_file = fopen(input_file_path, "r");
	}
	if (output_file_path == NULL) {
		output_file = stdout;
	} else {
		output_file = fopen(output_file_path, "w");
	}

	if (input_file == NULL || output_file == NULL) {
		printf("Error. I/O files can't be opened\n");
		dispose();
		return 1;
	}

	if (size_of_random_string > 0) {
		generate_random(size_of_random_string);
		is_generated = 1;
	} else {
		read_input();
	}
	if (testing_iteration_count > 0) {
		test(testing_iteration_count);
	} else {
		build_result_string();
		write_output();
	}

	dispose();
	return 0;
}
