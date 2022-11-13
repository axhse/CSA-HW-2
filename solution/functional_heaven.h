#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define MAX_STRING_SIZE 1000000

extern int is_generated;
extern int string_size;
extern char *input_string;
extern char *result_string;
extern FILE *input_file;
extern FILE *output_file;

void build_result_string();
void test(int iteration_count);
void generate_random(int size);
void read_input();
void write_output();
