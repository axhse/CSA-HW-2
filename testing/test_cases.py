
INPUT_FILE_NAME = 'input_file'
OUTPUT_FILE_NAME = 'output_file'
INVALID_INPUT_FILE_NAME = '...**@@'

TEST_CASES = {
    'Test Blank': {
        'arg_line': '',
        'input_string': '',
        'is_input_from_file': False,
        'is_output_to_file': False,
    },
    'Test Simple': {
        'arg_line': '',
        'input_string': 'simple TEST string 123 %%##$$++',
        'is_input_from_file': False,
        'is_output_to_file': False,
    },
    'Test All Chars': {
        'arg_line': '',
        'input_string': ''.join(chr(i) for i in range(0, 128)),
        'is_input_from_file': False,
        'is_output_to_file': False,
    },
    'Test Generator': {
        'arg_line': '-g 200',
        'is_input_from_file': False,
        'is_output_to_file': False,
    },
    'Test Input From File': {
        'arg_line': f'-i {INPUT_FILE_NAME}',
        'input_string': 'File Input String',
        'is_input_from_file': True,
        'is_output_to_file': False,
    },
    'Test Output To File': {
        'arg_line': f'-i {INPUT_FILE_NAME} -o {OUTPUT_FILE_NAME}',
        'input_string': 'File Input String',
        'is_input_from_file': True,
        'is_output_to_file': True,
    },
    'Test Testing': {
        'arg_line': '-g 100 -t 200000',
        'is_input_from_file': False,
        'is_output_to_file': False,
    },
    'Test Odd Arg Count': {
        'arg_line': f'-i {INPUT_FILE_NAME} -g 100 -t',
        'input_string': 'File Input String',
        'is_input_from_file': False,
        'is_output_to_file': False,
    },
    'Test Tag Error': {
        'arg_line': '-x 123',
        'is_input_from_file': False,
        'is_output_to_file': False,
    },
    'Test Input File Error': {
        'arg_line': f'-i {INVALID_INPUT_FILE_NAME}',
        'input_string': 'File Input String',
        'is_input_from_file': True,
        'is_output_to_file': False,
    },
    'Test Generating String Size Error': {
        'arg_line': '-g 1000001',
        'is_input_from_file': False,
        'is_output_to_file': False,
    },
    'Test Generating String Size Negative Value': {
        'arg_line': '-g -1',
        'is_input_from_file': False,
        'is_output_to_file': False,
    },
    'Test Testing Iteration Count Error': {
        'arg_line': '-g 100 -t 0',
        'is_input_from_file': False,
        'is_output_to_file': False,
    },
}
