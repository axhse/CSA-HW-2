#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define MAX_STRING_SIZE 1000000

int is_generated;
int string_size;
char *input_string;
char *result_string;
FILE *input_file;
FILE *output_file;

void build_result_string() {
	for (int i = 0; i < string_size; ++i) {
		result_string[i] = input_string[i];
		if ('a' <= input_string[i] && input_string[i] <= 'z') {
			result_string[i] += 'A' - 'a';
		} else if ('A' <= input_string[i] && input_string[i] <= 'Z') {
			result_string[i] += 'a' - 'A';
		}
	}
}

void test(int iteration_count) {
	clock_t begin = clock();
	for (int i = 0; i < iteration_count; ++i) {
		build_result_string();
	}
	clock_t end = clock();
	double elapsed_time = (double)(end - begin) / CLOCKS_PER_SEC;
	printf("Elapsed time:  %.3f seconds\n", elapsed_time);
}

void generate_random(int size) {
	string_size = size;
	srand(time(NULL));
	for (int i = 0; i < string_size; ++i) {
		input_string[i] = rand() % 128;
	}
}

void read_input() {
	if (input_file == stdin) {
		printf("  -- Input string:\n");
	}
	char symbol;
	while (1) {
		if (string_size == MAX_STRING_SIZE) {
			break;
		}
		symbol = fgetc(input_file);
		if (symbol == -1) {
			break;
		}
		input_string[string_size++] = symbol;
	}
	if (input_file == stdin) {
		printf("\n");
	}
}

void write_output() {
	if (is_generated) {
		fwrite("  -- Random string:\n", sizeof(char), 20, output_file);
		for(int i = 0; i < string_size; ++i) {
			fputc(input_string[i], output_file);
		}
		fwrite("\n\n", sizeof(char), 2, output_file);
	}
	fwrite("  -- Result string:\n", sizeof(char), 20, output_file);
	for(int i = 0; i < string_size; ++i) {
		fputc(result_string[i], output_file);
	}
	fwrite("\n", sizeof(char), 1, output_file);
}
