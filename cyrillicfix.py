import os
import re

input_path = os.getcwd()
search_dir = os.path.join(input_path, 'out')

def decode_match(match):
    codes = match.group(0).split("\\")[1:]
    byte_sequence = bytes([int(code) for code in codes])

    decoded_str = byte_sequence.decode('utf-8', errors='ignore')

    return decoded_str

def process_file(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    decoded_content = re.sub(r'\\(\d{3}(\\\d{3})*)', decode_match, content)

    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(decoded_content)

for root, dirs, files in os.walk(search_dir):
    for file in files:
        if file.endswith('.lua'):
            file_path = os.path.join(root, file)
            process_file(file_path)

print("Process is completed")
