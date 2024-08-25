from pathlib import Path
import subprocess
p = Path('build')
exelist = list(p.glob('**/*.exe'))
print(exelist)
for x in exelist:
    subprocess.run(str(x), cwd=x.parent, timeout = 3)
