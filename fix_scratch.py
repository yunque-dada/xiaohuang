import re

with open('/workspace/easy-scratch3/build/index.html', 'r') as f:
    content = f.read()

# Add projectHost after window.scratchConfig = {
old = 'window.scratchConfig = {'
new = '''window.scratchConfig = {
      projectHost: "http://zkbfew-vwawji-3000.app.cloudstudio.work",'''

content = content.replace(old, new, 1)

with open('/workspace/easy-scratch3/build/index.html', 'w') as f:
    f.write(content)

print('Done')
