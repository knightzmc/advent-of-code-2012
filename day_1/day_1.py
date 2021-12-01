count = 0
with open('input.txt', 'r') as lines:
    prev = None
    for line in lines.readlines():
        as_int = int(line)
        if prev == None:
            # N / A
            prev = as_int
            continue
        if as_int > prev:
            count += 1
        prev = as_int

print(count)