import os
import shutil
import subprocess

input_path = os.getcwd()
search_dir = os.path.join(input_path, 'in')
output_dir = os.path.join(input_path, 'out')
tools_dir = os.path.join(input_path, 'tools')

if not os.path.exists(output_dir):
    os.makedirs(output_dir)

for root, dirs, files in os.walk(search_dir):
    for file in files:
        if file.endswith('.luac'):
            rel_path = os.path.relpath(root, search_dir)
            file_path = os.path.join(root, file)

            shutil.move(file_path, os.path.join(tools_dir, file))

            dest_dir = os.path.join(output_dir, rel_path)
            if not os.path.exists(dest_dir):
                os.makedirs(dest_dir)

            os.chdir(tools_dir)
            cmd = ['quickbms.exe', '-Y', 'luac_mtasa.bms', file, dest_dir]
            subprocess.run(cmd)

            shutil.move(file, file_path)

print("Process is completed")
