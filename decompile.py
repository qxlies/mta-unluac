import os
import subprocess

input_path = os.getcwd()
search_dir = os.path.join(input_path, 'out')
tools_dir = os.path.join(input_path, 'tools')

for root, dirs, files in os.walk(search_dir):
    for file in files:
        if file.endswith('.luac'):
            file_path = os.path.join(root, file)
            output_file = os.path.join(root, f'{file[:-5]}.lua')

            os.chdir(tools_dir)

            cmd = ['java', '-jar', "unluac.jar", file_path, '>', output_file]
            
            subprocess.run(cmd, shell=True)

print("Process is completed")