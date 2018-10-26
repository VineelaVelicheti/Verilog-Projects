import binascii

filename = '500px-Checkerboard_pattern_100x100.bmp'

with open(filename, 'rb') as f:
	content = f.read()

content = binascii.hexlify(content)
content = content.decode()
length = len(content)
new_string = ""
for i in range(0, length, 8):
	new_string += (bin(int(content[i:i+8], 16))[2:]).zfill(32) + "\n"
fw = open("string_hex_full_binary2.txt", 'w')
fw.write(new_string)
