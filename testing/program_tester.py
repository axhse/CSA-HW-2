import sys
from subprocess import Popen, PIPE
from test_cases import *


def write_text(text, is_test_title=False, is_block_title=False):
    test_log_file.write(text)
    if is_block_title:
        print('\033[94m', end='')
    if is_test_title:
        print('\033[96m', end='')
    print(text, end='')
    print('\033[0m', end='')


def get_test_title_text(title):
    return f'\n{" " * 15}-***- {title} -***-\n'


def get_block_title_text(title):
    return f'{" " * 15}----- {title} -----\n'


test_log_file = open('testing_logs.txt', 'w')
if __name__ == "__main__":
    program_path = sys.argv[1]
    for case_name, case_data in TEST_CASES.items():
        write_text(get_test_title_text(case_name), is_test_title=True)
        command = [program_path] + list(case_data['arg_line'].split())
        write_text(get_block_title_text('COMMAND'), is_block_title=True)
        write_text(' '.join(command) + '\n')
        if case_data.get('input_string') is not None:
            write_text(get_block_title_text('INPUT'), is_block_title=True)
            write_text(case_data['input_string'] + '\n')
        write_text(get_block_title_text('OUTPUT'), is_block_title=True)
        if case_data['is_input_from_file']:
            with open(INPUT_FILE_NAME, 'w') as input_file:
                input_file.write(case_data["input_string"])
        process = Popen(command, stdin=PIPE, stdout=PIPE, stderr=PIPE, universal_newlines=True)
        if case_data['is_input_from_file'] or case_data.get('input_string') is None:
            output = process.communicate()[0]
        else:
            output = process.communicate(case_data['input_string'])[0]
        write_text(output + '\n')
        if case_data['is_output_to_file']:
            write_text(get_block_title_text('OUTPUT FILE'), is_block_title=True)
            with open(OUTPUT_FILE_NAME, 'r') as output_file:
                write_text(output_file.read() + '\n')
test_log_file.close()
